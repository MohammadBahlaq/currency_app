import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Go {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static Future<void> to(Widget page) async {
    _navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => page));
  }

  static Future<void> toReplace(Widget page) async {
    _navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static Future<void> toRemoveAll(Widget page) async {
    _navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static Future<void> toName(String page) async {
    _navigatorKey.currentState?.pushNamed(page);
  }

  static Future<void> toReplaceName(String page) async {
    _navigatorKey.currentState?.pushReplacementNamed(page);
  }

  static Future<void> toNameRemoveAll(String page) async {
    _navigatorKey.currentState?.pushNamedAndRemoveUntil(page, (route) => false);
  }

  static Future<void> back() async {
    _navigatorKey.currentState?.pop();
  }

  static Future<void> dialog({
    required Widget content,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => content,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
    );
  }

  static T get<T>() => navigatorKey.currentContext!.read<T>();
}
