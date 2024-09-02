import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: [
          buildNotificationItem('You thought you’d like a new winter look', '2h ago'),
          buildNotificationItem('You thought you’d like a new winter look', '3h ago'),
          buildNotificationItem('You thought you’d like a new winter look', '5h ago'),
        ],
      ),
    );
  }

  Widget buildNotificationItem(String title, String time) {
    return ListTile(
      leading: const Icon(Icons.notifications),
      title: Text(title),
      subtitle: Text(time),
      onTap: () {
        // Handle notification tap
      },
    );
  }
}
