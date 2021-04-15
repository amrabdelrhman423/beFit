import 'package:befit_app/UI/Splash.dart';
import 'package:befit_app/UI/register.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BE Fit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Splash.routeName,
      routes: routes,
    );
  }
}
