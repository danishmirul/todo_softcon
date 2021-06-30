import 'package:flutter/material.dart';
import './screens/dashboard.dart';
import './screens/details.dart';
import './screens/home.dart';
import './screens/login.dart';
import './screens/register.dart';

import 'constants.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(
        builder: (context) => Home(),
      );
    case loginRoute:
      return MaterialPageRoute(
        builder: (context) => Login(),
      );
    case registerRoute:
      return MaterialPageRoute(
        builder: (context) => Register(),
      );
    case dashboardRoute:
      return MaterialPageRoute(
        builder: (context) => Dashboard(settings.arguments),
      );

    case detailsRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(settings.arguments),
      );
  }
  return null;
}
