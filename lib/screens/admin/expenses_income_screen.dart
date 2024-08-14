import 'package:flutter/material.dart';

class Expenses_Income_Screen extends StatelessWidget {
  const Expenses_Income_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses & Income'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Add Expense'),
            onTap: () {
              // Navigate to Add Expense screen
            },
          ),
          ListTile(
            title: Text('Manage Expense'),
            onTap: () {
              // Navigate to Manage Expense screen
            },
          ),
          ListTile(
            title: Text('Add Expense Type'),
            onTap: () {
              // Navigate to Add Expense Type screen
            },
          ),
          ListTile(
            title: Text('Manage Expense Type'),
            onTap: () {
              // Navigate to Manage Expense Type screen
            },
          ),
          ListTile(
            title: Text('Add Income'),
            onTap: () {
              // Navigate to Add Income screen
            },
          ),
          ListTile(
            title: Text('Manage Income'),
            onTap: () {
              // Navigate to Manage Income screen
            },
          ),
        ],
      ),
    );
  }
}
