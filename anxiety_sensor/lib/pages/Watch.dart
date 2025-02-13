import 'package:flutter/material.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WatchScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/watch': (context) => WatchScreen(),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button and Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Watch',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Watch Image
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Image.asset(
                'assets/watch.png', // Make sure to add your watch image to assets
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            // Stats Grid
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFF2E7D32), // Dark Green
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    // Heart Rate Card
                    _buildStatCard(
                      title: 'Heart Rate',
                      value: '75',
                      unit: 'bpm',
                      icon: Icons.favorite,
                      chart: _buildLineChart(),
                    ),

                    // BPM Card
                    _buildStatCard(
                      title: 'BPM',
                      value: '120',
                      unit: 'bpm',
                      icon: Icons.show_chart,
                      chart: _buildBarChart(),
                    ),

                    // Battery Card
                    _buildStatCard(
                      title: 'Low Charging',
                      value: '20',
                      unit: '%',
                      icon: Icons.battery_alert,
                      showBatteryIndicator: true,
                    ),

                    // Temperature Card
                    _buildStatCard(
                      title: 'Temperature',
                      value: '36.5',
                      unit: '°C',
                      icon: Icons.thermostat,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    Widget? chart,
    bool showBatteryIndicator = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBatteryIndicator) ...[
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        value: 0.2,
                        strokeWidth: 8,
                        backgroundColor: Colors.grey[800],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                    Center(
                      child: Icon(
                        icon,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (chart != null) Expanded(child: chart),
          if (!showBatteryIndicator && chart == null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return CustomPaint(
      painter: LineChartPainter(),
    );
  }

  Widget _buildBarChart() {
    return CustomPaint(
      painter: BarChartPainter(),
    );
  }
}

// Custom painter for line chart
class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.75,
      size.width,
      size.height * 0.5,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for bar chart
class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final barWidth = size.width / 8;
    final spacing = size.width / 16;

    for (int i = 0; i < 5; i++) {
      final height = size.height * (0.3 + (i * 0.1));
      final rect = Rect.fromLTWH(
        i * (barWidth + spacing) + spacing,
        size.height - height,
        barWidth,
        height,
      );
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
