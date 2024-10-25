import 'package:flutter/material.dart';
import 'package:moviepedia/Model/Firebase_database_model/Database_Model.dart';
import 'package:moviepedia/utils/routes/routeNames.dart';
import 'package:moviepedia/view/screens/dashboard_screen.dart';
import 'package:moviepedia/view/screens/movie_view.dart';
import 'package:moviepedia/view/screens/sign_up.dart';

import '../../view/screens/login_screen.dart';
import '../../view/screens/splash_Screen.dart';
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (context) =>  const DashboardScreen());
      case RouteName.movieScreen:
        final args=settings.arguments as DatabaseModel;
        return MaterialPageRoute(builder: (context) =>  MovieView(model: args,));
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
