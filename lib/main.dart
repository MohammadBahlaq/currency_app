import 'package:currency_app/core/component.dart';
import 'package:currency_app/core/navigation.dart';
import 'package:currency_app/current_project.dart/view/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            navigatorKey: Go.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const HomePage2(),
          ),
        );
      },
    );
  }
}
