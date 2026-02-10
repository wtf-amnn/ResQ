import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications
    final notifications = [
      'Your report #123 has been resolved! 🐕',
      'New rating received: 5 stars ⭐',
      'Case #456 accepted by rescuer',
      'Status update: Animal admitted to hospital',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: Builder(builder: (context) => IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer())),
      ),
      drawer: (context).findAncestorWidgetOfExactType<Scaffold>()?.drawer,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: Text(notifications[index]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
