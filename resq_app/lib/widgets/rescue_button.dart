import 'package:flutter/material.dart';

class RescueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RescueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Large, prominent green Rescue button that pops above nav [web:2]
    return Container(
      margin: const EdgeInsets.all(16),
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.local_hospital, size: 28),
        label: const Text(
          'RESCUE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 8,
        heroTag: 'rescue',
      ),
    );
  }
}
