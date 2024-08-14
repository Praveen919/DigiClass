import 'package:flutter/material.dart';

class EstudyScreen extends StatelessWidget {
  const EstudyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Create Study Material'),
            onTap: () {
              // Navigate to Create Study Material screen
            },
          ),
          ListTile(
            title: Text('Manage Study Material'),
            onTap: () {
              // Navigate to Manage Study Material screen
            },
          ),
          ListTile(
            title: Text('Manage Shared Study Material'),
            onTap: () {
              // Navigate to Manage Shared study material screen
            },
          ),

        ],
      ),
    );
  }
}
