import 'package:flutter/material.dart';
import 'package:nav_demo/pages/home.dart';
import 'package:nav_demo/pages/login.dart';
import 'package:nav_demo/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator 1.0',
      routes: <String, WidgetBuilder> {
        '/login': (_) =>  const Login(),
        '/home': (_) =>  const Home(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
