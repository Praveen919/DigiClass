import 'package:flutter/material.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Send message for Inquiry'),
            onTap: () {
              // Navigate to Send Message for Inquiry screen
            },
          ),
          ListTile(
            title: Text('Send message to Student'),
            onTap: () {
              // Navigate to Send message to Student screen
            },
          ),
          ListTile(
            title: Text('Send message to Staff'),
            onTap: () {
              // Navigate to Send message to Staff screen
            },
          ),
          ListTile(
            title: Text('Send Staff Id/Password'),
            onTap: () {
              // Navigate to Send Staff Id/Password screen
            },
          ),
          ListTile(
            title: Text('Send Student Id/Password'),
            onTap: () {
              // Navigate to Send Student Id/Password screen
            },
          ),
          ListTile(
            title: Text('Send Upcoming Exam Reminder'),
            onTap: () {
              // Navigate to Send Upcoming Exam Reminder screen
            },
          ),
          ListTile(
            title: Text('Send Exam Marks Message'),
            onTap: () {
              // Navigate to Send Exam MArks message screen
            },
          ),
          ListTile(
            title: Text('Send Fee Status Message'),
            onTap: () {
              // Navigate to Send Fee Status Message screen
            },
          ),
          ListTile(
            title: Text('Send Fee Reminder'),
            onTap: () {
              // Navigate to Send Fee Reminder screen
            },
          ),
          ListTile(
            title: Text('Send Absent Student Attendance Message'),
            onTap: () {
              // Navigate to Send Absent Student Attendance Message screen
            },
          ),
        ],
      ),
    );
  }
}
