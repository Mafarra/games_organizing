import 'package:games_organizing/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashView,
    );
  }
}
