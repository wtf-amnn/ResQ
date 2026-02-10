import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/alert_card.dart';
import '../widgets/rescue_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for dashboard and alerts
    final dashboardData = [
      {'icon': Icons.check_circle, 'title': 'Resolved', 'value': '1,247', 'color': Colors.green},
      {'icon': Icons.schedule, 'title': 'Active', 'value': '23', 'color': Colors.orange},
    ];

    final alerts = [
      {
        'image': 'assets/dog_injured.jpg', // Placeholder - replace with real assets
        'title': 'Injured Dog on Road',
        'desc': 'Stray dog hit by vehicle',
        'status': 'Open',
        'time': '2 mins ago',
      },
      {
        'image': 'assets/cat_stuck.jpg',
        'title': 'Cat Stuck in Tree',
        'desc': 'Neighborhood cat needs help',
        'status': 'Accepted',
        'time': '15 mins ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 32), // Placeholder logo
            const SizedBox(width: 8),
            const Text('ResQ'),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero container
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade400, Colors.green.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help an Animal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Every life matters. Report now to save a life.',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Large emergency button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: RescueButton(onPressed: () {}),
              ),
            ),
            // Community impact dashboard
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Community Impact',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: dashboardData.map((data) => Expanded(
                  child: DashboardCard(
                    icon: IconData(data['icon']!, fontFamily: 'MaterialIcons'),
                    title: data['title']!,
                    value: data['value']!,
                    color: data['color']! as Color,
                  ),
                )).toList(),
              ),
            ),
            const SizedBox(height: 24),
            // Recent alerts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent Alerts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            ...alerts.map((alert) => AlertCard(
              imageUrl: alert['image']!,
              title: alert['title']!,
              description: alert['desc']!,
              status: alert['status']!,
              time: alert['time']!,
            )),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    // Hamburger menu drawer [web:14]
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text('ResQ Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(leading: const Icon(Icons.login), title: const Text('Login / Signup'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.help), title: const Text('Help Center'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.palette), title: const Text('Change Theme'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.language), title: const Text('Change Language'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.contact_mail), title: const Text('Contact Us'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.info), title: const Text('About Us'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
