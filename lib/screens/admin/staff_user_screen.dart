import 'package:flutter/material.dart';

class Staff_USer_Screen extends StatelessWidget {
  const Staff_USer_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff/User'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Create Staff'),
            onTap: () {
              // Navigate to Create Staff Screen
            },
          ),
          ListTile(
            title: Text('Manage Staff'),
            onTap: () {
              // Navigate to Manage Staff screen
            },
          ),
          ListTile(
            title: Text('Manage Staff Rights'),
            onTap: () {
              // Navigate to Manage Staff Rights screen
            },
          ),
          ListTile(
            title: Text('Staff Attendance'),
            onTap: () {
              // Navigate to Staff Attendance screen
            },
          ),
          
        ],
      ),
    );
  }
}
