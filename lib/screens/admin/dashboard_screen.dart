import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testing_app/screens/loginscreen.dart';
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
  final String name;
  final String branch;
  final String year;

  const DashboardScreen({
    super.key,
    required this.name,
    required this.branch,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Panel'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();  // Open the drawer
            },
          ),
        ),
      ),
      drawer: const SidePanel(),  // Adding the drawer here
      body: DashboardTab(
        name: name,
        branch: branch,
        year: year,
      ),
    );
  }
}


class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
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
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);  // Close the drawer
              // Navigate to Dashboard or any screen
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile Setting'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(option: 'profileSetting'),
                    ),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.key_sharp),
                title: const Text('Change Password'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(option: 'changePassword'),
                    ),
                  );
                  // Navigate to Profile Setting screen
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.whatsapp),
                title: const Text('Auto WhatsApp Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(option: 'autoWhatsApp'),
                    ),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_active_outlined),
                title: const Text('Auto Notification Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(option: 'autoNotification'),
                    ),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.my_library_books_rounded),
                title: const Text('My Plan'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(option: 'myPlan'),
                    ),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt),
                title: const Text('My Referral'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(option:'myReferral'),
                    ),
                  );
                  // Navigate to Change Password screen
                },
              ),
              // Add more settings options here
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: const Text('Setup'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.edit_calendar_rounded),
                title: const Text('Add Year'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'addYear')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_calendar_rounded),
                title: const Text('Manage Year'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'manageYear')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_turned_in),
                title: const Text('Assign Standard'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'assignStandard')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_turned_in_sharp),
                title: const Text('Assign Subject'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'assignSubject')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.group_add),
                title: const Text('Add Class/Batch'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'addClassBatch')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.group_add_outlined),
                title: const Text('Manage Class/Batch'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'manageClassBatch')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.schedule_outlined),
                title: const Text('Manage TimeTable'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetupScreen(option: 'manageTimeTable')),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.people),
            title: const Text('Staff/User'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Create Staff'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StaffUserScreen(option: 'createStaff')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_outline_sharp),
                title: const Text('Manage Staff'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StaffUserScreen(option: 'manageStaff')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.how_to_reg),
                title: const Text('Manage Staff Rights'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StaffUserScreen(option: 'manageStaffRights')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.app_registration),
                title: const Text('Staff Attendance'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StaffUserScreen(option: 'staffAttendance')),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.people),
            title: const Text('Student'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.add_alert),
                title: const Text('Add Student Inquiry'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'addInquiry')),
                  );
                  // Navigate to Change Password screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.border_color_outlined),
                title: const Text('Manage Student Inquiry'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'manageInquiry')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_circle_outline_sharp),
                title: const Text('Import Students'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'importStudents')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt),
                title: const Text('Add Student Registration'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'addRegistration')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.manage_accounts),
                title: const Text('Manage Student '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'manageStudent')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_turned_in_outlined),
                title: const Text('Assign Class/Batch'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'assignClassBatch')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.app_registration_sharp),
                title: const Text('Student Attendance'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'studentAttendance')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: const Text('Share Documents'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'shareDocuments')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Manage Shared Documents'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'manageSharedDocuments')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.message_outlined),
                title: const Text('Chat with Students'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'chatWithStudents')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: const Text('Students Feedback'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'studentsFeedback')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.key),
                title: const Text('Student Rights'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'studentRights')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.key_outlined),
                title: const Text('App. Access Rights'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentScreen(option:'appAccessRights')),
                  );// Navigate to App Access Rights screen
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.attach_money_sharp),
            title: const Text('Fee'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.menu_book_sharp),
                title: const Text('Create Fee Structure'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeeScreen(option:'createFeeStructure')),

                  );

                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_note),
                title: const Text('Manage Fee Structure'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeeScreen(option: 'manageFeeStructure')),

                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.school),
            title: const Text('Exam'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.post_add),
                title: const Text('Create Manual Exam'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExamScreen(option: 'createManualExam')),

                  );
                  // Navigate to Student management
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_note_sharp),
                title: const Text('Manage Manual Exam'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExamScreen(option: 'manageManualExam')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.my_library_books_sharp),
                title: const Text('Create MCQ Exam'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExamScreen(option: 'createMCQExam')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_note),
                title: const Text('Manage MCQ Exam'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExamScreen(option: 'manageMCQExam')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_rounded),
                title: const Text('Create Assignments'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExamScreen(option: 'createAssignments')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Manage Assignments'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExamScreen(option: 'manageAssignments')),

                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('eStudy'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: const Text('Create Study Material'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EstudyScreen(option: 'createStudyMaterial')),

                  );
                  // Navigate to Student management
                },
              ),
              ListTile(
                leading: const Icon(Icons.mode_edit_sharp),
                title: const Text('Manage Study Material'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EstudyScreen(option: 'manageStudyMaterial')),

                  );

                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_note_sharp),
                title: const Text('Manage Shared Study Material'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EstudyScreen(option: 'manageSharedStudyMaterial')),

                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text('Messaging'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.add_alert),
                title: const Text('Send Message for Inquiry'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'inquiry')),

                  );

                },
              ),ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Send message to Student'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'student')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_sharp),
                title: const Text('Send message to Staff'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'staff')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.password_outlined),
                title: const Text('Send Staff Id/Password'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'staffIdPassword')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.password),
                title: const Text('Send Student Id/Password'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'studentIdPassword')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.remember_me),
                title: const Text('Send Upcoming Exam Reminder'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'examReminder')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.score_outlined),
                title: const Text('Send Exam Marks Message'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'examMarks')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.query_stats),
                title: const Text('Send Fee Status Message'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'feeStatus')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Send Fee Reminder'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'feeReminder')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_remove_alt_1_outlined),
                title: const Text('Send Absent Student Attendance Message'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessagingScreen(option: 'absentAttendance')),

                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Expense & Income'),
            children:<Widget>[
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Add Expense'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensesIncomeScreen(option: 'addExpense')),

                  );
                  // Navigate to Student management
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Manage Expense'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensesIncomeScreen(option: 'manageExpense')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: const Text('Add Expense Type'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensesIncomeScreen(option: 'addExpenseType')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Manage Expense Type'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensesIncomeScreen(option: 'manageExpenseType')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: const Text('Add Income'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensesIncomeScreen(option: 'addIncome')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Manage Income'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensesIncomeScreen(option: 'manageIncome')),

                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.file_open_outlined),
            title: const Text('Report'),
            children:<Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Student Inquiry Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'studentInquiry')),

                  );
                  // Navigate to Student management
                },
              ),
              ListTile(
                leading: const Icon(Icons.details_rounded),
                title: const Text('Student Detail Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'studentDetail')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.grade),
                title: const Text('Student Card Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'studentCard')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_calendar_outlined),
                title: const Text('Student Attendance Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'studentAttendance')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_sharp),
                title: const Text('Fee Status Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'feeStatus')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_sharp),
                title: const Text('Fee Collection'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'feeCollection')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_sharp),
                title: const Text('Expense Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'expense')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_sharp),
                title: const Text('Income Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'income')),

                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book_sharp),
                title: const Text('Profit/Loss Report'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'profitLoss')),

                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.check_circle_outlined),
                title: const Text('App Access Rights'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen(option:'appAccessRights')),

                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.live_help_outlined),
            title: const Text('Help'),
            children:<Widget>[
              ListTile(
                leading: const Icon(Icons.connect_without_contact),
                title: const Text('Conatct US'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen(option: 'contactUs')),

                  );
                  // Navigate to Student management
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Feedback'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen(option: 'feedback')),

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
  final String name;
  final String branch;
  final String year;

  const DashboardTab({
    super.key,
    required this.name,
    required this.branch,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserInfoCard(
            name: name,
            branch: branch,
            year: year,
          ),
          const NotificationsCard(),
          const StatisticsCard(),
          const MonthlyFeeCollectionChart(),
          const FeeStatusCard(),
          const FinancialSummaryCard(),
        ],
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String name;
  final String branch;
  final String year;

  const UserInfoCard({
    super.key,
    required this.name,
    required this.branch,
    required this.year,
  });

  // Function to handle user logout and navigate to login screen
  void _logout(BuildContext context) {
    // Add any logout logic here, like clearing user data, tokens, etc.
    // Then, navigate to the login screen
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
        const CircleAvatar(child: Text('Logo')), // Adjust logo as necessary
        title: Text(name), // Display the user's name
        subtitle:
        Text('Branch: $branch\nYear: $year'), // Display branch and year
        trailing: IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: () =>
              _logout(context), // Call the logout function when pressed
        ),
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
            trailing:
            CircleAvatar(backgroundColor: Colors.orange, child: Text('0')),
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
            trailing:
            CircleAvatar(backgroundColor: Colors.green, child: Text('0')),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Total Students'),
            trailing:
            CircleAvatar(backgroundColor: Colors.blue, child: Text('1')),
          ),
          ListTile(
            leading: Icon(Icons.person_off),
            title: Text('Today Absentees'),
            trailing:
            CircleAvatar(backgroundColor: Colors.cyan, child: Text('0')),
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
