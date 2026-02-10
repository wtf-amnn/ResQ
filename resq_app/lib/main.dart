import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home_screen.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const ResQApp());
}

class ResQApp extends StatelessWidget {
  const ResQApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Main app widget that sets up the theme and home screen
    return MaterialApp(
      title: 'ResQ',
      theme: resQTheme, // Using our custom Material 3 theme [web:1]
      home: const MainScreen(), // Screen with persistent bottom nav
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Tracks active bottom nav tab

  // List of all screens for bottom navigation
  final List<Widget> _screens = const [
    HomeScreen(),
    ActivityScreen(),
    SizedBox.shrink(), // Placeholder for center Rescue tab
    HelplineScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Preserves screen state on tab switch
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButton: RescueButton(
        onPressed: () {
          // Navigate to Rescue screen (empty callback as per rules)
          Navigator.pushNamed(context, '/rescue');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Center position over nav bar [web:11]
      bottomNavigationBar: ResQBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
