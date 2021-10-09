import 'package:flutter/material.dart';
import 'package:nav2_demo/router/parser.dart';

import 'app.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    delegate.push(name: '/splash');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigator 2.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: delegate,
      routeInformationParser: const MyRouteInformationParser(),
    );
  }
}
