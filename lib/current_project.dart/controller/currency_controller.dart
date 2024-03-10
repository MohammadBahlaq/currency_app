import 'dart:convert';

import 'package:currency_app/core/component.dart';
import 'package:currency_app/core/dialogs/error_dialog.dart';
import 'package:currency_app/core/dialogs/loading_dialog.dart';
import 'package:currency_app/core/navigation.dart';
import 'package:currency_app/core/network.dart';
import 'package:currency_app/current_project.dart/controller/sqllite_db.dart';
import 'package:currency_app/current_project.dart/model/transaction.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyController with ChangeNotifier {
  final SqlLiteDB _sqlLiteDB = SqlLiteDB();

  Currency? fromCurrency;
  Currency? toCurrency;
  double currencyPrice = 0;
  List<Trasnaction> transactions = [];

  Future<void> getCurrencyTrasnactions() async {
    // transactions.clear();
    transactions = await _sqlLiteDB.getCurrencyTrasnactions();
    notifyListeners();
  }

  Future<void> convert(String amount) async {
    if (fromCurrency == null || toCurrency == null || amount.isEmpty) {
      Go.dialog(content: const ErrorDialog(message: "Select Currency please"));
      return;
    }

    Go.dialog(content: const LoadingDialog());

    double amt = double.parse(amount);

    NetworkController.myHttpClient(
      HttpMethod.get,
      defaultUrl: "https://free.currconv.com/api/v7/convert?q=${fromCurrency!.code}_${toCurrency!.code}&compact=ultra&apiKey=cc0316acc76986ac5763",
    ).then((value) {
      Go.back();

      Map map = jsonDecode(value);
      // log(value);

      currencyPrice = map["${fromCurrency!.code}_${toCurrency!.code}"] * amt;
      // log(currencyPrice.toString());
      notifyListeners();
      insertTransaction(amt, currencyPrice).then((value) => getCurrencyTrasnactions());
    });
  }

  Future<void> insertTransaction(double price1, double price2) async {
    if (fromCurrency == null || toCurrency == null) return;

    Trasnaction trasnaction = Trasnaction(
      selectedDate: DateFormat(dateFormate).format(DateTime.now()),
      countryCode1: fromCurrency!.code,
      countryName1: fromCurrency!.name,
      countryFlag1: fromCurrency!.flag,
      currencyPrice1: price1,
      countryCode2: toCurrency!.code,
      countryName2: toCurrency!.name,
      countryFlag2: toCurrency!.flag,
      currencyPrice2: price2,
    );

    await _sqlLiteDB.insertBatch([trasnaction.toJson()], "Trasnaction");
  }

  void setFromCurrency(Currency currency) {
    fromCurrency = currency;
    notifyListeners();
  }

  void setToCurrency(Currency currency) {
    toCurrency = currency;
    notifyListeners();
  }
}
