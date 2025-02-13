import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // Light green background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Hello Message
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
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

              const SizedBox(height: 24),

              // Settings Options
              _buildSettingItem(
                icon: Icons.person_outline,
                title: 'Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              const SizedBox(height: 12),

              _buildSettingItem(
                icon: Icons.watch_outlined,
                title: 'Wearer',
                onTap: () {},
              ),
              const SizedBox(height: 12),

              _buildSettingItem(
                icon: Icons.settings_outlined,
                title: 'Preferences',
                onTap: () {},
              ),
              const SizedBox(height: 12),

              _buildSettingItem(
                icon: Icons.logout_outlined,
                title: 'Sign Out',
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),

              const Spacer(),

              // Bottom Navigation
              Container(
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
                      icon: Icon(Icons.bar_chart, color: Colors.green[600]),
                      onPressed: () {
                        Navigator.pushNamed(context, '/stats');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.green[600]),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
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

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: Colors.black87,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
