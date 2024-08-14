import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Add Year'),
            onTap: () {
              // Navigate to Add year screen
            },
          ),
          ListTile(
            title: Text('Manage Year'),
            onTap: () {
              // Navigate to Manage Year screen
            },
          ),
          ListTile(
            title: Text('Assign Standard'),
            onTap: () {
              // Navigate to Assign standard screen
            },
          ),
          ListTile(
            title: Text('Assign Subject'),
            onTap: () {
              // Navigate to Assign Subject screen
            },
          ),
          ListTile(
            title: Text('Add Class/Batch'),
            onTap: () {
              // Navigate to Add class/batch screen
            },
          ),
          ListTile(
            title: Text('Manage Class/Batch'),
            onTap: () {
              // Navigate to Manage Class/batch screen
            },
          ),
          ListTile(
            title: Text('Manage TimeTable'),
            onTap: () {
              // Navigate to Manage TimeTable screen
            },
          ),
        ],
      ),
    );
  }
}
