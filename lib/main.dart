import 'package:app_bloc_example/application/routes/route_generator.dart';
import 'package:app_bloc_example/application/styles/themes_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Example',
      theme: ThemesApp.primary,
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: "/",
    );
  }
}