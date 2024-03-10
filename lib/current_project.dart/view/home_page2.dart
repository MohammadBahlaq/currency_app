import 'package:currency_app/core/component.dart';
import 'package:currency_app/core/navigation.dart';
import 'package:currency_app/current_project.dart/controller/currency_controller.dart';
import 'package:currency_app/current_project.dart/model/transaction.dart';
import 'package:currency_app/widget/my_dropdown.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  late TextEditingController _textController;

  @override
  void initState() {
    final currencyCrt = Go.get<CurrencyController>();

    _textController = TextEditingController();
    currencyCrt.getCurrencyTrasnactions();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  final currencyCrt = Go.get<CurrencyController>();

  @override
  Widget build(BuildContext context) {
    // currencyCrt.getCurrencyTrasnactions();

    return Scaffold(
      appBar: AppBar(title: const Text("Home page")),
      body: ListView(
        padding: EdgeInsets.only(top: 1.h, right: 1.w, left: 1.w),
        children: [
          Selector<CurrencyController, Currency?>(
            selector: (p0, p1) => p1.fromCurrency,
            builder: (context, fromCurrency, child) {
              return CurrencyDropdown(
                currency: fromCurrency,
                textController: _textController,
                onPressed: (Currency currency) => currencyCrt.setFromCurrency(currency),
              );
            },
          ),
          SizedBox(height: 1.h),
          Selector<CurrencyController, Currency?>(
            selector: (p0, p1) => p1.toCurrency,
            builder: (context, toCurrency, child) {
              return CurrencyDropdown(
                currency: toCurrency,
                onPressed: (Currency currency) => currencyCrt.setToCurrency(currency),
              );
            },
          ),
          SizedBox(height: 1.h),
          ElevatedButton(
            child: Text("Convert", style: TextStyle(fontSize: 16.sp)),
            onPressed: () => currencyCrt.convert(_textController.text),
          ),
          SizedBox(height: 3.h),
          Text(
            "History",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(height: 1.h),
          Selector<CurrencyController, List<Trasnaction>>(
            selector: (p0, p1) => p1.transactions,
            builder: (context, transactions, child) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: primaryColor.withOpacity(0.5),
                    title: Text(
                      transactions[index].countryCode2 ?? "null",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    leading: Text(
                      "${transactions[index].countryCode1 ?? ""} (${transactions[index].currencyPrice1})",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    trailing: Text("${transactions[index].currencyPrice2}"),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
