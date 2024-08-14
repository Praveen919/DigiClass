import 'package:flutter/material.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Create Fee Structure'),
            onTap: () {
              // Navigate to Create Fee Structure screen
            },
          ),
          ListTile(
            title: Text('Manage Fee Structure'),
            onTap: () {
              // Navigate to Manage Fee Structure screen
            },
          ),
          ListTile(
            title: Text('Fee Collection'),
            onTap: () {
              // Navigate to Fee Collection screen
            },
          ),

        ],
      ),
    );
  }
}
