import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(58, 167, 114, 1),
              const Color.fromRGBO(0, 88, 66, 1)
            ], // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo with Ribbon
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/Green_Ribbon.png', // Replace with your ribbon image asset
                height: 200,
              ),
            ),

            SizedBox(height: 20),

            // App Title
            Text(
              'Stress',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              ' Less',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 5),

            // Subtitle
            Text(
              'Health Care App',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),

            SizedBox(height: 30),

            // Username Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Password Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Forgot Password Text
            TextButton(
              onPressed: () {}, // TODO: Implement Forgot Password Logic
              child: Text(
                'Forgot Password? Click here',
                style: TextStyle(color: Colors.white70),
              ),
            ),

            SizedBox(height: 10),

            // Login Button
            ElevatedButton(
              onPressed: () {}, // TODO: Implement Login Logic
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            SizedBox(height: 10),

            // OR Divider
            Text(
              'Or',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),

            SizedBox(height: 10),

            // Create Account Button
            ElevatedButton(
              onPressed: () {}, // TODO: Implement Registration Logic
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              child: Text(
                'Create an account',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
