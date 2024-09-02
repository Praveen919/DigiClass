import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  final String option;

  ReportScreen({required this.option});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.option) {
      case 'studentInquiry':
        return StudentInquiryReportScreen();
      case 'studentDetail':
        return StudentDetailReportScreen();
      case 'studentCard':
        return StudentCardReportScreen();
      case 'studentAttendance':
        return StudentAttendanceReportScreen();
      case 'pendingFee':
        return PendingFeeReportScreen();
      case 'feeStatus':
        return FeeStatusReportScreen();
      case 'feeCollection':
        return FeeCollectionScreen();
      case 'expense':
        return ExpenseReportScreen();
      case 'income':
        return IncomeReportScreen();
      case 'profitLoss':
        return ProfitLossReportScreen();
      case 'studentInquiryAnalysis':
        return StudentInquiryAnalysisReportScreen();
      case 'feeAnalysis':
        return FeeAnalysisReportScreen();
      case 'appAccessRights':
        return AppAccessRightsScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

// Below are the placeholder widgets for each report screen.
// Replace these with your actual implementation.

class StudentInquiryReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Inquiry Report Screen'));
  }
}

class StudentDetailReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Detail Report Screen'));
  }
}

class StudentCardReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Card Report Screen'));
  }
}

class StudentAttendanceReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Attendance Report Screen'));
  }
}

class PendingFeeReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Pending Fee Report Screen'));
  }
}

class FeeStatusReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fee Status Report Screen'));
  }
}

class FeeCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fee Collection Screen'));
  }
}

class ExpenseReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Expense Report Screen'));
  }
}

class IncomeReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Income Report Screen'));
  }
}

class ProfitLossReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profit/Loss Report Screen'));
  }
}

class StudentInquiryAnalysisReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Student Inquiry Analysis Report Screen'));
  }
}

class FeeAnalysisReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fee Analysis Report Screen'));
  }
}

class AppAccessRightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('App Access Rights Screen'));
  }
}
