import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:testing_app/screens/admin/estudy_screen.dart';
import 'package:testing_app/screens/admin/exam_screen.dart';
import 'package:testing_app/screens/admin/expenses_income_screen.dart';
import 'package:testing_app/screens/admin/fee_screen.dart';
import 'package:testing_app/screens/admin/help_screen.dart';
import 'package:testing_app/screens/admin/messaging_screen.dart';
import 'package:testing_app/screens/admin/report_screen.dart';
import 'package:testing_app/screens/admin/settings_screen.dart';
import 'package:testing_app/screens/admin/setup_screen.dart';
import 'package:testing_app/screens/admin/staff_user_screen.dart';
import 'package:testing_app/screens/admin/student_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Panel'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Dashboard'),
              Tab(text: 'Tutorial'),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();  // Open the drawer
              },
            ),
          ),
        ),
        drawer: SidePanel(),  // Adding the drawer here
        body: const TabBarView(
          children: [
            DashboardTab(),
            Center(child: Text('Tutorial Content')),
          ],
        ),
      ),
    );
  }
}

class SidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'My Panel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);  // Close the drawer
              // Navigate to Dashboard or any screen
            },
          ),
           ExpansionTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile Setting'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('Change Password'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), 
                 );
                  // Navigate to Profile Setting screen
                },
              ),
              ListTile(
                title: Text('Auto WhatsApp Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('Auto Notification Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('My Plan'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('My Referral'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              // Add more settings options here
            ],
          ),
           ExpansionTile(
            leading: Icon(Icons.settings),
            title: Text('Setup'),
            children: <Widget>[
              ListTile(
                title: Text('Add Year'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('Manage Year'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('Assign Standard'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('Assign Subject'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                title: Text('Add Class/Batch'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
            title: Text('Manage Class/Batch'),
            onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Manage TimeTable'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetupScreen()), 
                 );
            },
           ),
            ],
            ),
          ExpansionTile(
            leading: Icon(Icons.people),
            title: Text('Staff/User'),
            children: <Widget>[
              ListTile(
                title: Text('Create Staff'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Staff_USer_Screen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
              title: Text('Manage Staff'),
              onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Staff_USer_Screen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Manage Staff Rights'),
            onTap: () {
                Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Staff_USer_Screen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Staff Attendance'),
            onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Staff_USer_Screen()), 
                 );
            },
          ),
            ],
          ),
         ExpansionTile(
            leading: Icon(Icons.people),
            title: Text('Student'),
            children: <Widget>[
              ListTile(
                title: Text('Add Student Inquiry'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
            title: Text('Manage Student Inquiry'),
            onTap: () {
                Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Import Students'),
            onTap: () {
                Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Add Student Registration'),
            onTap: () {
                Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Manage Student'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Assign Class/Batch'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Student Attendance'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Share Documents'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),        
          ListTile(
            title: Text('Manage Shared Documents'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Chat with Students'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Students Feedback'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('Student Rights'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );
            },
          ),
          ListTile(
            title: Text('App. Access Rights'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()), 
                 );// Navigate to App Access Rights screen
            },
          ),
            ],
         ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Fee'),
            children: <Widget>[
              ListTile(
                title: Text('Create Fee Structure'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeeScreen()), 
          
              );
              
            },
          ),
          ListTile(
            title: Text('Manage Fee Structure'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeeScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Fee Collection'),
            onTap: () {
              Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeeScreen()), 
          
              );
            },
          ),
            ],
           ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Exam'),
            children: <Widget>[
              ListTile(
                title: Text('Create Manual Exam'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamScreen()), 
          
              );
              // Navigate to Student management
            },
          ),
          ListTile(
            title: Text('Manage Manual Exam'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Create MCQ Exam'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Manage MCQ Exam'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Create Assignments'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Manage Assignments'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamScreen()), 
          
              );
            },
          ),
            ],
            ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('eStudy'),
            children: <Widget>[
              ListTile(
                title: Text('Create Study Material'),
               onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EstudyScreen()), 
          
              );
              // Navigate to Student management
            },
          ),
          ListTile(
            title: Text('Manage Study Material'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EstudyScreen()), 
          
              );
              
            },
          ),
          ListTile(
            title: Text('Manage Shared Study Material'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EstudyScreen()), 
          
              );
            },
          ),
            ],
           ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Messaging'),
            children: <Widget>[
              ListTile(
                title: Text('Send Message for Inquiry'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
             
            },
          ),ListTile(
            title: Text('Send message to Student'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send message to Staff'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Staff Id/Password'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Student Id/Password'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Upcoming Exam Reminder'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Exam Marks Message'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Fee Status Message'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Fee Reminder'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Send Absent Student Attendance Message'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagingScreen()), 
          
              );
            },
          ),
            ],
            ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Expense & Income'),
            children:<Widget>[
              ListTile(
                title: Text('Add Expense'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Expenses_Income_Screen()), 
          
              );
              // Navigate to Student management
            },
          ),
          ListTile(
            title: Text('Manage Expense'),
            onTap: () {
             Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Expenses_Income_Screen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Add Expense Type'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Expenses_Income_Screen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Manage Expense Type'),
            onTap: () {
             Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Expenses_Income_Screen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Add Income'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Expenses_Income_Screen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Manage Income'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Expenses_Income_Screen()), 
          
              );
            },
          ),
            ],
           ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Report'),
            children:<Widget>[
              ListTile(
                title: Text('Student Inquiry Report'),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
              // Navigate to Student management
            },
          ),
          ListTile(
            title: Text('Student Detail Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Student Card Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Student Attendance Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Pending Fee Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Fee Status Report'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Fee Collection'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Expense Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Income Report'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Profit/Loss Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Student Inquiry Analysis Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('Fee Analysis Report'),
            onTap: () {
               Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
          ListTile(
            title: Text('App Access Rights'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportScreen()), 
          
              );
            },
          ),
            ],
           ),
           ExpansionTile(
            leading: Icon(Icons.school),
            title: Text('Help'),
            children:<Widget>[
              ListTile(
                title: Text('Conatct US'),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpScreen()), 
          
              );
              // Navigate to Student management
            },
          ),
          ListTile(
                title: Text('Feedback'),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpScreen()), 
          
              );
              // Navigate to Student management
            },
          ),
            ],
            ),
          // Add more ListTiles for other menu items as per your design
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          UserInfoCard(),
          NotificationsCard(),
          StatisticsCard(),
          MonthlyFeeCollectionChart(),
          FeeStatusCard(),
          FinancialSummaryCard(),
        ],
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: CircleAvatar(child: Text('Logo')),
        title: Text('User 1'),
        subtitle: Text('Branch-1\n2024-2025'),
        trailing: Icon(Icons.power_settings_new),
      ),
    );
  }
}

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Today's Notifications"),
            trailing: CircleAvatar(backgroundColor: Colors.orange, child: Text('0')),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Last date for Subscription'),
            trailing: Text('31 Dec 2024'),
          ),
        ],
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Student Status'),
            trailing: Icon(Icons.arrow_drop_down),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("Today's Inquiries"),
            trailing: CircleAvatar(backgroundColor: Colors.green, child: Text('0')),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Total Students'),
            trailing: CircleAvatar(backgroundColor: Colors.blue, child: Text('1')),
          ),
          ListTile(
            leading: Icon(Icons.person_off),
            title: Text('Today Absentees'),
            trailing: CircleAvatar(backgroundColor: Colors.cyan, child: Text('0')),
          ),
        ],
      ),
    );
  }
}

class MonthlyFeeCollectionChart extends StatelessWidget {
  const MonthlyFeeCollectionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Monthly Fee Collection'),
            SizedBox(height: 200, child: BarChart(mainBarData())),
          ],
        ),
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      // Implement the bar chart data here
    );
  }
}

class FeeStatusCard extends StatelessWidget {
  const FeeStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Text('Fee Status'),
          const Text('Today Fee Collection: ₹0'),
          SizedBox(height: 200, child: PieChart(PieChartData())),
          const ListTile(title: Text('Total Fees'), trailing: Text('₹0')),
          const ListTile(title: Text('Received Fees'), trailing: Text('₹0')),
          const ListTile(title: Text('Pending Fees'), trailing: Text('₹0')),
        ],
      ),
    );
  }
}

class FinancialSummaryCard extends StatelessWidget {
  const FinancialSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Total Income'),
            trailing: Icon(Icons.attach_money),
          ),
          ListTile(
            title: Text('Total Expense'),
            trailing: Text('₹0'),
          ),
          ListTile(
            title: Text('Profit/Loss'),
            trailing: Icon(Icons.attach_money),
          ),
        ],
      ),
    );
  }
}
/*https://www.figma.com/proto/QDv0ZOA5joCftuPL14imWv/Untitled?page-id=0%3A1&node-id=4-3&viewport=538%2C316%2C0.
56&t=95oB0YAjJGF1CD8L-1&scaling=scale-down&content-scaling=fixed&starting-point-node-id=4%3A3&show-proto-sidebar=1
*/