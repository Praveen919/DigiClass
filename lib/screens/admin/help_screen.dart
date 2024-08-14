import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
              // Navigate to Contact Us screen
            },
          ),
          ListTile(
            title: Text('Feedback'),
            onTap: () {
              // Navigate to Feedback screen
            },
          ),

        ],
      ),
    );
  }
}
