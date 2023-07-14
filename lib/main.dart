import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/data/services.dart';
import 'package:suitmedia_test/di/locator.dart';
import 'package:suitmedia_test/presentation/first_screen/first_screen.dart';
import 'package:suitmedia_test/presentation/routes.dart';
import 'package:suitmedia_test/presentation/third_screen/third_screen_viewmodel.dart';

void main() {

  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThirdScreenViewModel(
          services: getItLocator<Services>(),
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      home: const FirstScreen(),
    );
  }
}
