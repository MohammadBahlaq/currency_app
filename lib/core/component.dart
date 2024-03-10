import 'package:currency_app/current_project.dart/controller/currency_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

const primaryColor = Color(appColor);

const int appColor = 0xFC23bd29;

const dateFormate = "yyyy-MM-dd HH:mm:ss";
const String numRegex = "^([0-9]+(\\.[0-9]*)?)?\$";

MaterialColor primarySwatch = MaterialColor(
  appColor,
  <int, Color>{
    50: const Color(appColor).withOpacity(0.1), //10%
    100: const Color(appColor).withOpacity(0.2), //20%
    200: const Color(appColor).withOpacity(0.3), //30%
    300: const Color(appColor).withOpacity(0.4), //40%
    400: const Color(appColor).withOpacity(0.5), //50%
    500: const Color(appColor).withOpacity(0.6), //60%
    600: const Color(appColor).withOpacity(0.7), //70%
    700: const Color(appColor).withOpacity(0.8), //80%
    800: const Color(appColor).withOpacity(0.9), //90%
    900: const Color(appColor).withOpacity(1), //100%
  },
);

ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  primarySwatch: primarySwatch,
  useMaterial3: false,
);

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => CurrencyController()),
];

enum Prefs {
  isFirstTime,
}
