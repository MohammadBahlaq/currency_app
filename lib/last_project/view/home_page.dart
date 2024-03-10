// import 'dart:convert';
// import 'dart:developer';

// import 'package:currency_app/controller/convert_controller.dart';
// import 'package:currency_app/core/component.dart';
// import 'package:currency_app/core/navigation.dart';
// import 'package:currency_app/main.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     final currencyCrt = Go.get<CurrencyController>();

//     if (prefs.getBool(Prefs.isFirstTime.name) == null) {
//       currencyCrt.getAllCurrencies();
//     } else {
//       currencyCrt.getAllCurrencies();
//     }

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currencyCrt = Go.get<CurrencyController>();

//     currencyCrt.getAllCurrenciesSql();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Home page")),
//       body: ListView(
//         padding: EdgeInsets.only(top: 1.h, right: 1.w, left: 1.w),
//         children: [
//           Selector<CurrencyController, int>(
//             selector: (p0, p1) => p1.currensies.length,
//             builder: (context, value, child) {
//               return DropdownSearch<Currency>(
//                 items: currencyCrt.currensies,
//                 itemAsString: (item) => item.countryCode ?? "",
//                 onChanged: (value) {
//                   log(jsonEncode(value!.toJson()));
//                   currencyCrt.fromCurrency = value;
//                 },
//                 dropdownBuilder: (context, selectedItem) {
//                   if (selectedItem == null) {
//                     return Text("From", style: TextStyle(fontSize: 16.sp));
//                   }
//                   return ListTile(
//                     title: Text(
//                       selectedItem.countryCode ?? "",
//                       style: TextStyle(fontSize: 16.sp),
//                     ),
//                     leading: selectedItem.countryFlag != null ? Image.network(selectedItem.countryFlag!) : null,
//                   );
//                 },
//                 clearButtonProps: const ClearButtonProps(color: Colors.red, isVisible: true),
//                 popupProps: PopupProps.dialog(
//                   showSearchBox: true,
//                   itemBuilder: (context, item, isSelected) => ListTile(
//                     title: Text(item.countryCode ?? ""),
//                     leading: item.countryFlag != null ? Image.network(item.countryFlag!) : null,
//                   ),
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 1.h),
//           Selector<CurrencyController, int>(
//             selector: (p0, p1) => p1.currensies.length,
//             builder: (context, value, child) {
//               return DropdownSearch<Currency>(
//                 items: currencyCrt.currensies,
//                 itemAsString: (item) => item.countryCode ?? "",
//                 onChanged: (value) => currencyCrt.toCurrency = value,
//                 dropdownBuilder: (context, selectedItem) {
//                   if (selectedItem == null) {
//                     return Text("To", style: TextStyle(fontSize: 16.sp));
//                   }
//                   return ListTile(
//                     title: Text(
//                       selectedItem.countryCode ?? "",
//                       style: TextStyle(fontSize: 16.sp),
//                     ),
//                     leading: selectedItem.countryFlag != null ? Image.network(selectedItem.countryFlag!) : null,
//                   );
//                 },
//                 clearButtonProps: const ClearButtonProps(color: Colors.red, isVisible: true),
//                 popupProps: PopupProps.dialog(
//                   showSearchBox: true,
//                   itemBuilder: (context, item, isSelected) => ListTile(
//                     title: Text(item.countryCode ?? ""),
//                     leading: item.countryFlag != null ? Image.network(item.countryFlag!) : null,
//                   ),
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 1.h),
//           ElevatedButton(
//             child: Text("Convert", style: TextStyle(fontSize: 16.sp)),
//             onPressed: () => _convert(),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _convert() async {
//     final currencyCrt = Go.get<CurrencyController>();

//     currencyCrt.insertTransaction();
//     currencyCrt.convert();
//   }
// }
