// import 'dart:convert';
// import 'dart:developer';
// import 'package:currency_app/controller/sqllite_db.dart';
// import 'package:currency_app/core/component.dart';
// import 'package:currency_app/core/network.dart';
// import 'package:currency_app/main.dart';
// import 'package:currency_app/model/currency.dart';
// import 'package:currency_app/model/transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CurrencyController with ChangeNotifier {
//   final SqlLiteDB _sqlLiteDB = SqlLiteDB();

//   List<Currency> currensies = [];
//   Currency? fromCurrency;
//   Currency? toCurrency;

//   Future<void> getAllCurrencies() async {
//     NetworkController.myHttpClient(
//       HttpMethod.get,
//       defaultUrl: "https://flagcdn.com/en/codes.json",
//     ).then((value) async {
//       Map<String, dynamic> data = jsonDecode(value);
//       // log(jsonEncode(data));
//       data.forEach((countryCode, countryName) {
//         currensies.add(
//           Currency(
//             countryCode: countryCode,
//             countryName: countryName,
//             countryFlag: "https://flagcdn.com/28x21/$countryCode.png",
//           ),
//         );
//       });
//       await _sqlLiteDB.delete("Currency", "");
//       _sqlLiteDB
//           .insertBatch(
//             currensies.map((e) => e.toJson()).toList(),
//             "Currency",
//           )
//           .then((value) => prefs.setBool(Prefs.isFirstTime.name, true));
//       notifyListeners();
//     });
//   }

//   Future<void> getAllCurrenciesSql() async {
//     currensies = await _sqlLiteDB.getAllCurrencies();
//     _sqlLiteDB.getCurrencyTrasnactions();
//     notifyListeners();
//   }

//   Future<void> insertTransaction() async {
//     if (fromCurrency == null || toCurrency == null) return;

//     Trasnaction trasnaction = Trasnaction(
//       selectedDate: DateFormat(dateFormate).format(DateTime.now()),
//       countryCode1: fromCurrency!.countryCode,
//       countryName1: fromCurrency!.countryName,
//       countryFlag1: fromCurrency!.countryFlag,
//       countryCode2: toCurrency!.countryCode,
//       countryName2: toCurrency!.countryName,
//       countryFlag2: toCurrency!.countryFlag,
//     );

//     await _sqlLiteDB.insertBatch([trasnaction.toJson()], "Trasnaction");
//   }

//   Future<void> convert() async {}

//   void restValues() {
//     currensies.clear();
//   }
// }
