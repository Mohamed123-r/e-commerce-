import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    // case LanguageView.routeName:
    //   return MaterialPageRoute(builder: (_) => LanguageView());
    //
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
