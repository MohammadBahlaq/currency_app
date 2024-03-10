import 'package:currency_app/core/component.dart';
import 'package:currency_app/current_project.dart/controller/currency_controller.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrencyDropdown extends StatelessWidget {
  const CurrencyDropdown({
    super.key,
    required this.currency,
    required this.onPressed,
    this.textController,
    this.result,
  });

  final Currency? currency;
  final Function(Currency) onPressed;
  final TextEditingController? textController;
  final double? result;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: textController == null
              ? Selector<CurrencyController, double>(
                  selector: (p0, p1) => p1.currencyPrice,
                  builder: (context, value, child) => Text(
                    (value).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                )
              : TextField(
                  controller: textController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => RegExp(numRegex).hasMatch(newValue.text) ? newValue : oldValue,
                    ),
                  ],
                ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () => showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: onPressed,
            ),
            child: currency != null ? Text(currency!.code) : const Text("Select currency"),
          ),
        ),
      ],
    );
  }
}
