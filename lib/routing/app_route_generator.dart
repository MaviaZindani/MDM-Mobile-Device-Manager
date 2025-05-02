import 'package:appoint_it/screens/intro_screen.dart';
import 'package:appoint_it/screens/main_screen/main_screen.dart';
import 'package:appoint_it/screens/splash_screen.dart';

import 'app_route_names.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      case AppRoutesNames.initial:
        return _screenRoute(screen: const SplashScreen());
      case AppRoutesNames.introScreen:
        return _screenRoute(screen: const IntroScreen());
      case AppRoutesNames.mainScreen:
        return _screenRoute(screen: MainScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _screenRoute({Widget? screen}) {
    return MaterialPageRoute(builder: (context) => screen!);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Something went wrong',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',
                  color: Color(0xff2D3139))),
        ),
      );
    });
  }
}
