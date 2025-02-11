import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Profile.dart';
import 'Watch.dart';
import 'Search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/watch': (context) => WatchScreen(),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, _getRoute(index));
  }

  String _getRoute(int index) {
    switch (index) {
      case 0:
        return '/home';
      case 1:
        return '/watch';
      case 2:
        return '/search';
      case 3:
        return '/profile';
      default:
        return '/home';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.10;

    return Scaffold(
      backgroundColor: const Color(0xFF197225), // Matches the green background
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        toolbarHeight: 0, // No visible AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xFF81C784),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Hello user",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Meditation card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color(0xFF81C784),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    // Meditation content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "meditation",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "take a break",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "10 min",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Meditation image
                    Image.asset(
                      'assets/meditation.png', // Replace with your asset image path
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Grid of cards
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio:
                      0.8, // Adjust the aspect ratio to make the cards smaller
                  children: List.generate(4, (index) {
                    if (index == 0) {
                      // Bar chart card
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150, // Set the height of the card
                            width: 150, // Set the width of the card
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                barGroups: [
                                  BarChartGroupData(
                                    x: 0,
                                    barRods: [
                                      BarChartRodData(
                                        y: 8,
                                        colors: [Colors.green],
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 1,
                                    barRods: [
                                      BarChartRodData(
                                        y: 10,
                                        colors: [Colors.green],
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 2,
                                    barRods: [
                                      BarChartRodData(
                                        y: 14,
                                        colors: [Colors.green],
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 3,
                                    barRods: [
                                      BarChartRodData(
                                        y: 15,
                                        colors: [Colors.green],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (index == 1) {
                      // Calendar card
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150, // Set the height of the card
                            width: 150, // Set the width of the card
                            child: TableCalendar(
                              firstDay: DateTime.utc(2020, 1, 1),
                              lastDay: DateTime.utc(2030, 12, 31),
                              focusedDay: _focusedDay,
                              selectedDayPredicate: (day) {
                                return isSameDay(_selectedDay, day);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay =
                                      focusedDay; // update `_focusedDay` here as well
                                });
                              },
                              calendarFormat: _calendarFormat,
                              availableCalendarFormats: const {
                                CalendarFormat.month: 'Month',
                                CalendarFormat.week: 'Week',
                              },
                              onFormatChanged: (format) {
                                setState(() {
                                  _calendarFormat = format;
                                });
                              },
                              onPageChanged: (focusedDay) {
                                _focusedDay = focusedDay;
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    // Empty cards
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.grey[200],
                      child: SizedBox(
                        height: 150, // Set the height of the card
                        width: 150, // Set the width of the card
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF4CAF50),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Wearable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
