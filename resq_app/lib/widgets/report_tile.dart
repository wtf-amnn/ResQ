import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  final IconData typeIcon;
  final String title;
  final String time;
  final String status;
  final String location;

  const ReportTile({
    super.key,
    required this.typeIcon,
    required this.title,
    required this.time,
    required this.status,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    // List tile for activity reports (like PhonePe history style)
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green.shade100,
        child: Icon(typeIcon, color: Colors.green),
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time),
          Text(location, style: const TextStyle(fontSize: 12)),
        ],
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: status == 'Rescued' ? Colors.green : Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          status,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
