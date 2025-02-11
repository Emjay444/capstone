import 'package:flutter/material.dart';
import 'pages/Login.dart';
import 'pages/Signup.dart';
import 'pages/Forgotpass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anxiety Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => const Signup(),
        '/forgot-password': (context) => const Forgotpass(),
      },
    );
  }
}
