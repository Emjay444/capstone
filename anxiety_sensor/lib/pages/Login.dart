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
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Enables scrolling if needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Background Gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(58, 167, 114, 1),
                      const Color.fromRGBO(0, 88, 66, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image.asset(
                        'assets/Green_Ribbon.png',
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 20),

                    // App Title
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      width: 340,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stress',
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Less',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontSize: 64,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Subtitle
                    Transform.translate(
                      offset: Offset(0, -25),
                      child: Text(
                        'Health Care App',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

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

                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 80
                          : 90,
                    ), // ✅ Adjust spacing before bottom container

                    // Bottom Section with Buttons (ALWAYS below the password field)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 20,
                          left: 30,
                          right: 30,
                          bottom: 100), // ✅ Use bottom padding instead
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot-password');
                            },
                            child: Text(
                              'Forgot Password? Click here',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                            ),
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Or',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                            ),
                            child: Text(
                              'Create an account',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
