import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Add Student Inquiry'),
            onTap: () {
              // Navigate to Add Student Inquiry screen
            },
          ),
          ListTile(
            title: Text('Manage Student Inquiry'),
            onTap: () {
              // Navigate to Manage Student Inquiry screen
            },
          ),
          ListTile(
            title: Text('Import Students'),
            onTap: () {
              // Navigate to Import students screen
            },
          ),
          ListTile(
            title: Text('Add Student Registration'),
            onTap: () {
              // Navigate to Add Student Registration screen
            },
          ),
          ListTile(
            title: Text('Manage Student'),
            onTap: () {
              // Navigate to Manage Student screen
            },
          ),
          ListTile(
            title: Text('Assign Class/Batch'),
            onTap: () {
              // Navigate to Assign Class/Batch screen
            },
          ),
          ListTile(
            title: Text('Student Attendance'),
            onTap: () {
              // Navigate to Student Attendance screen
            },
          ),
          ListTile(
            title: Text('Share Documents'),
            onTap: () {
              // Navigate to Share DOcuments screen
            },
          ),        
          ListTile(
            title: Text('Manage Shared Documents'),
            onTap: () {
              // Navigate to Manage Shared Documents screen
            },
          ),
          ListTile(
            title: Text('Chat with Students'),
            onTap: () {
              // Navigate to Chat with Students screen
            },
          ),
          ListTile(
            title: Text('Students Feedback'),
            onTap: () {
              // Navigate to Students Feedback screen
            },
          ),
          ListTile(
            title: Text('Student Rights'),
            onTap: () {
              // Navigate to Student Rights screen
            },
          ),
          ListTile(
            title: Text('App. Access Rights'),
            onTap: () {
              // Navigate to App Access Rights screen
            },
          ),
        ],
      ),
    );
  }
}
