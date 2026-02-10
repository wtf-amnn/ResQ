import 'package:flutter/material.dart';

class HelplineScreen extends StatelessWidget {
  const HelplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock NGO data
    final ngos = [
      {'name': 'Paws Rescue Mumbai', 'distance': '2.3 km'},
      {'name': 'Animal Aid Unlimited', 'distance': '5.1 km'},
      {'name': 'Blue Cross India', 'distance': '1.8 km'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpLine / NGOs'),
        leading: Builder(builder: (context) => IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer())),
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      drawer: (context).findAncestorWidgetOfExactType<Scaffold>()?.drawer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search NGOs, Hospitals...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ngos.length,
              itemBuilder: (context, index) {
                final ngo = ngos[index];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.local_hospital)),
                    title: Text(ngo['name']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(ngo['distance']!),
                        IconButton(icon: const Icon(Icons.call), onPressed: () {}),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
