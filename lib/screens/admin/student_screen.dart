import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  final String option;

  StudentScreen({required this.option});

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.option) {
      case 'addInquiry':
        return AddStudentInquiryScreen();
      case 'manageInquiry':
        return ManageStudentInquiryScreen();
      case 'importStudents':
        return ImportStudentsScreen();
      case 'addRegistration':
        return AddStudentRegistrationScreen();
      case 'manageStudent':
        return ManageStudentScreen();
      case 'assignClassBatch':
        return AssignClassBatchScreen();
      case 'studentAttendance':
        return StudentAttendanceScreen();
      case 'shareDocuments':
        return ShareDocumentsScreen();
      case 'manageSharedDocuments':
        return ManageSharedDocumentsScreen();
      case 'chatWithStudents':
        return ChatWithStudentsScreen();
      case 'studentsFeedback':
        return StudentsFeedbackScreen();
      case 'studentRights':
        return StudentRightsScreen();
      case 'appAccessRights':
        return AppAccessRightsScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

// Below are the placeholder widgets for each student-related screen.
// Replace these with your actual implementation.

class AddStudentInquiryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add Student Inquiry Screen'));
  }
}

class ManageStudentInquiryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Student Inquiry Screen'));
  }
}

class ImportStudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Import Students Screen'));
  }
}

class AddStudentRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add Student Registration Screen'));
  }
}

class ManageStudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Student Screen'));
  }
}

class AssignClassBatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Assign Class/Batch Screen'));
  }
}

class StudentAttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Attendance Screen'));
  }
}

class ShareDocumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Share Documents Screen'));
  }
}

class ManageSharedDocumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Shared Documents Screen'));
  }
}

class ChatWithStudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat with Students Screen'));
  }
}

class StudentsFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Students Feedback Screen'));
  }
}

class StudentRightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Rights Screen'));
  }
}

class AppAccessRightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('App. Access Rights Screen'));
  }
}
