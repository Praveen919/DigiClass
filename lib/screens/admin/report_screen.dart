import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Student Inquiry Report'),
            onTap: () {
              // Navigate to Student Inquiry Report screen
            },
          ),
          ListTile(
            title: Text('Student Detail Report'),
            onTap: () {
              // Navigate to Student Detail Report screen
            },
          ),
          ListTile(
            title: Text('Student Card Report'),
            onTap: () {
              // Navigate to Student Card Report screen
            },
          ),
          ListTile(
            title: Text('Student Attendance Report'),
            onTap: () {
              // Navigate to Student Attendance Report screen
            },
          ),
          ListTile(
            title: Text('Pending Fee Report'),
            onTap: () {
              // Navigate to Pending Fee Report screen
            },
          ),
          ListTile(
            title: Text('Fee Status Report'),
            onTap: () {
              // Navigate to Fee Status Report screen
            },
          ),
          ListTile(
            title: Text('Fee Collection'),
            onTap: () {
              // Navigate to Fee Collection screen
            },
          ),
          ListTile(
            title: Text('Expense Report'),
            onTap: () {
              // Navigate to Expense Report screen
            },
          ),
          ListTile(
            title: Text('Income Report'),
            onTap: () {
              // Navigate to Income Report screen
            },
          ),
          ListTile(
            title: Text('Profit/Loss Report'),
            onTap: () {
              // Navigate to Profit/Loss Report screen
            },
          ),
          ListTile(
            title: Text('Student Inquiry Analysis Report'),
            onTap: () {
              // Navigate to Student Inquiry Analysis Report screen
            },
          ),
          ListTile(
            title: Text('Fee Analysis Report'),
            onTap: () {
              // Navigate to Fee Analysis Report screen
            },
          ),
          ListTile(
            title: Text('App Access Rights'),
            onTap: () {
              // Navigate to App Access Rights screen
            },
          ),
        ],
      ),
    );
  }
}
