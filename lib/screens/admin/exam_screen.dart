import 'package:flutter/material.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Create Manual Exam'),
            onTap: () {
              // Navigate to Create manual exam screen
            },
          ),
          ListTile(
            title: Text('Manage Manual Exam'),
            onTap: () {
              // Navigate to Manage manual exam screen
            },
          ),
          ListTile(
            title: Text('Create MCQ Exam'),
            onTap: () {
              // Navigate to Create MCQ Exam screen
            },
          ),
          ListTile(
            title: Text('Manage MCQ Exam'),
            onTap: () {
              // Navigate to Manage MCQ exam screen
            },
          ),
          ListTile(
            title: Text('Create Assignments'),
            onTap: () {
              // Navigate to Create Assignments screen
            },
          ),
          ListTile(
            title: Text('Manage Assignments'),
            onTap: () {
              // Navigate to Manage Assignments Screen
            },
          ),
        ],
      ),
    );
  }
}
