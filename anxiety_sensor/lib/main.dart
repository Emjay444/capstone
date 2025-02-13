import 'package:flutter/material.dart';
import 'pages/Login.dart';
import 'pages/Signup.dart';
import 'pages/Forgotpass.dart';
import 'pages/Home.dart'; // Import the Home page
import 'pages/Search.dart'; // Import the Search page
import 'pages/Profile.dart'; // Import the Profile page
import 'pages/Watch.dart'; // Import the Watch page
import 'pages/Stats.dart'; // Import the Stats page
import 'pages/Settings.dart'; // Import the Settings page

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
      initialRoute: '/home', // Set the initial route to search
      routes: {
        '/': (context) => Login(),
        '/register': (context) => const Signup(),
        '/forgot-password': (context) => const Forgotpass(),
        '/home': (context) => HomeScreen(), // Add the home route
        '/search': (context) => SearchScreen(), // Add the search route
        '/profile': (context) => ProfileScreen(), // Add the profile route
        '/watch': (context) => WatchScreen(), // Add the watch route
        '/stats': (context) => StatsScreen(), // Add the stats route
        '/settings': (context) => SettingsScreen(), // Add the settings route
      },
    );
  }
}
