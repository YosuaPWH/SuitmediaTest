import 'package:flutter/material.dart';
import 'package:suitmedia_test/presentation/first_screen/first_screen.dart';
import 'package:suitmedia_test/presentation/second_screen/second_screen.dart';
import 'package:suitmedia_test/presentation/third_screen/third_screen.dart';

class AppRoutes{
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case NamedRoute.firstScreen:
        return MaterialPageRoute<void>(
          builder: (context) => const FirstScreen(),
          settings: settings,
        );

      case NamedRoute.secondScreen:
        return MaterialPageRoute<void>(
          builder: (context) => SecondScreen(
            username: settings.arguments as String,
          ),
          settings: settings,
        );

      case NamedRoute.thirdScreen:
        return MaterialPageRoute<void>(
          builder: (context) => const ThirdScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<void>(
          builder: (context) => _UndefinedView(name: settings.name),
          settings: settings,
        );
    }
  }
}

class _UndefinedView extends StatelessWidget {
  const _UndefinedView({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}

class NamedRoute {
  NamedRoute._();

  static const String firstScreen = '/firstScreen';
  static const String secondScreen = '/secondScreen';
  static const String thirdScreen = '/thirdScreen';
}