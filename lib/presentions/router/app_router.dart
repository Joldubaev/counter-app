import 'package:flutter/material.dart';
import 'package:flutter_example/presentions/screens/home_screen.dart';
import 'package:flutter_example/presentions/screens/second_screen.dart';
import 'package:flutter_example/presentions/screens/threed_screen.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MyHomeScreen(
                title: 'Home Page',
                color: Theme.of(_).colorScheme.inversePrimary));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                title: 'Second Page',
                color: Theme.of(_).colorScheme.inversePrimary));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThreedScreen(
                title: 'Third Page',
                color: Theme.of(_).colorScheme.inversePrimary));

      default:
        return null;
    }
  }

 
}
