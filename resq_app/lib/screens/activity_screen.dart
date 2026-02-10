import 'package:flutter/material.dart';
import '../widgets/report_tile.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock activity data
    final activities = [
      {
        'icon': Icons.pets,
        'title': 'Dog - Hit by car',
        'time': '2 hours ago',
        'status': 'In Progress',
        'location': 'Andheri, Mumbai',
      },
      {
        'icon': Icons.pets,
        'title': 'Cat - Malnourished',
        'time': '1 day ago',
        'status': 'Rescued',
        'location': 'Bandra, Mumbai',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Reports'),
        leading: Builder(builder: (context) => IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer())),
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      drawer: (context).findAncestorWidgetOfExactType<Scaffold>()?.drawer, // Reuse drawer
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...activities.map((activity) => ReportTile(
            typeIcon: IconData(activity['icon']!, fontFamily: 'MaterialIcons'),
            title: activity['title']!,
            time: activity['time']!,
            status: activity['status']!,
            location: activity['location']!,
          )),
        ],
      ),
    );
  }
}
