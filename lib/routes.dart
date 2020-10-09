import 'package:flutter/material.dart';

import 'screens/input_page.dart';
import 'screens/result_page.dart';

class AppRoutes {
  static final RouteName root = RouteName(route: "/");
  static final RouteName result = RouteName(route: "/result");

  static final Map<String, WidgetBuilder> routes = {
    root.route: (context) => InputPage(),
    result.route: (context) => ResultPage(),
  };

  static void closePage(BuildContext context) => Navigator.pop(context);
}

class RouteName {
  final String route;

  RouteName({this.route});

  void navigateFrom(BuildContext context) {
    Navigator.pushNamed(context, this.route);
  }
}
