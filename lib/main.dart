import 'package:flutter/material.dart';
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
        '/branchYearSelection': (context) => const BranchYearSelectionScreen(),
        '/adminDashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
