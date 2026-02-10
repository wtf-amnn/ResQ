import 'package:flutter/material.dart';

class ResQBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ResQBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Custom bottom nav with 5 tabs, Rescue is center and skipped [web:2]
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(), // Notch for center FAB [web:6]
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(Icons.home, 0, 'Home'),
          _navItem(Icons.history, 1, 'Activity'),
          const SizedBox(width: 40), // Space for center Rescue button
          _navItem(Icons.local_hospital, 3, 'HelpLine'),
          _navItem(Icons.person, 4, 'Profile'),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index, String label) {
    final bool isActive = currentIndex == index;
    return IconButton(
      onPressed: () => onTap(index),
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.green : Colors.black54,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.green : Colors.black54,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
