
import 'package:flutter/material.dart';
import 'package:moviepedia/view/routes/routeNames.dart';
import 'package:moviepedia/view/screens/splash_Screen.dart';

import '../screens/login_screen.dart';
import '../screens/sign_up.dart';
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      // case RouteName.dashboardScreen:
      //   return MaterialPageRoute(builder: (context) =>  DashboardScreen());
        default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return const Scaffold(
          body: Text("NO ROUTE DEFINED"),
        );
      },
    );
  }
}
