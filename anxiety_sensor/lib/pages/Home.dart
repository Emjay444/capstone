import 'package:flutter/material.dart';
import 'Login.dart';
import 'Signup.dart';
import 'Forgotpass.dart';
import 'Search.dart';
import 'Profile.dart';
import 'Watch.dart';
import 'Stats.dart';
import 'Settings.dart'; // Import the Settings page

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
      initialRoute: '/profile', // Set the initial route to search
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // Light green background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hello Message
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Hello Mejia!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Meditation Card and Action Icons Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meditation Card
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'meditation',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'take a break',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '(5 min)',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Action Icons Grid
                  Expanded(
                    flex: 3,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 20,
                      childAspectRatio: 4,
                      children: [
                        _buildActionIcon(
                            Icons.watch_outlined, 'Watch', context, '/watch'),
                        _buildActionIcon(
                            Icons.navigation, 'Navigation', context, '/search'),
                        _buildActionIcon(Icons.person_outline, 'Profile',
                            context, '/profile'),
                        _buildActionIcon(Icons.calendar_today, 'Calendar',
                            context, null, _showDateTimePicker),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Connection Status
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Connected'),
                    Row(
                      children: [
                        BatteryIndicator(
                          batteryLevel: 0.75, // Example battery level
                        ),
                        const SizedBox(width: 8),
                        const Text('75%'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              

              // Notifications Section
              const Text(
                'Your Notifications',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    NotificationCard(
                      message: "Don't forget to take a break!",
                      time: "09:02 AM",
                    ),
                    const SizedBox(height: 8),
                    NotificationCard(
                      message: "Try to take a walk if you have time :)",
                      time: "05:07 PM",
                    ),
                    const SizedBox(height: 8),
                    NotificationCard(
                      message: "Don't wait until tomorrow!",
                      time: "06:03 PM",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(
            horizontal: 50), // Adjust margin to center the nav bar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.green[600]),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.bar_chart,
                  color: Colors.green[600]), // Change icon to bar_chart
              onPressed: () {
                Navigator.pushNamed(context, '/stats'); // Route to stats.dart
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.green[600]),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/settings'); // Route to settings.dart
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon(
      IconData icon, String label, BuildContext context, String? route,
      [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap ??
          () {
            if (route != null) {
              Navigator.pushNamed(context, route);
            }
          },
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap ??
            () {
              if (route != null) {
                Navigator.pushNamed(context, route);
              }
            },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.green[600],
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: Colors.green[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
        });
      }
    });
  }

}

class NotificationCard extends StatelessWidget {
  final String message;
  final String time;

  const NotificationCard({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class BatteryIndicator extends StatelessWidget {
  final double batteryLevel;

  const BatteryIndicator({super.key, required this.batteryLevel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Stack(
        children: [
          Container(
            width: batteryLevel * 36,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: batteryLevel > 0.2 ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          Positioned(
            right: 2,
            top: 5,
            bottom: 5,
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
