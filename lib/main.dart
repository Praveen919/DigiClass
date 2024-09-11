import 'package:flutter/material.dart';
import 'package:testing_app/screens/students/dashboard_screen.dart';
import 'package:testing_app/screens/teachers/dashboardt.dart';
import 'screens/loginscreen.dart';
import 'screens/create_account_screen.dart';
import 'screens/branch_year_selection_screen.dart';
import 'screens/admin/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiClass',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/', // Default route
      routes: {
        '/': (context) => const LoginScreen(),
        '/createAccount': (context) => const CreateAccountScreen(),
        '/branchYearSelection': (context) => const BranchYearSelectionScreen(userRole: ''),
        '/adminDashboard': (context) => const DashboardScreen(),
        '/teacherDashboard': (context) => const DashboardT(),
        '/studentDashboard': (context) => const Dashboard1Screen()
      },
    );
  }
}
