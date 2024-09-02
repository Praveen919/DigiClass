import 'package:flutter/material.dart';

class MessagingScreen extends StatefulWidget {
  final String option;

  MessagingScreen({required this.option});

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.option) {
      case 'inquiry':
        return SendInquiryMessageScreen();
      case 'student':
        return SendStudentMessageScreen();
      case 'staff':
        return SendStaffMessageScreen();
      case 'staffIdPassword':
        return SendStaffIdPasswordScreen();
      case 'studentIdPassword':
        return SendStudentIdPasswordScreen();
      case 'examReminder':
        return SendExamReminderScreen();
      case 'examMarks':
        return SendExamMarksMessageScreen();
      case 'feeStatus':
        return SendFeeStatusMessageScreen();
      case 'feeReminder':
        return SendFeeReminderScreen();
      case 'absentAttendance':
        return SendAbsentAttendanceMessageScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

// Below are the placeholder widgets for each message screen.
// Replace these with your actual implementation.

class SendInquiryMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Inquiry Message Screen'));
  }
}

class SendStudentMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Student Message Screen'));
  }
}

class SendStaffMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Staff Message Screen'));
  }
}

class SendStaffIdPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Staff Id/Password Screen'));
  }
}

class SendStudentIdPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Student Id/Password Screen'));
  }
}

class SendExamReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Exam Reminder Screen'));
  }
}

class SendExamMarksMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Exam Marks Message Screen'));
  }
}

class SendFeeStatusMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Fee Status Message Screen'));
  }
}

class SendFeeReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Fee Reminder Screen'));
  }
}

class SendAbsentAttendanceMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Send Absent Student Attendance Message Screen'));
  }
}
