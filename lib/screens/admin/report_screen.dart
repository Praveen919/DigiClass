import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates

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

class StudentInquiryReportScreen extends StatefulWidget {
  @override
  _StudentInquiryReportScreenState createState() => _StudentInquiryReportScreenState();
}

class _StudentInquiryReportScreenState extends State<StudentInquiryReportScreen> {
  DateTime? fromDate;
  DateTime? toDate;
  bool isSolved1 = false;
  bool isSolved2 = false;

  // Method to select a date
  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Inquiry Report'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      drawer: Drawer(), // Add your drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, fromDate, (date) {
                      setState(() {
                        fromDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        fromDate != null ? DateFormat.yMMMd().format(fromDate!) : 'From Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, toDate, (date) {
                      setState(() {
                        toDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        toDate != null ? DateFormat.yMMMd().format(toDate!) : 'To Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle Get Data action
                  },
                  child: Text('Get Data'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Student Name: XXXXXXX\nStandard: XX\nInquiry Date: XX/XX/XXXX\nInquiry Source: XXXXXXXX'),
                    trailing: IconButton(
                      icon: Icon(
                        isSolved1 ? Icons.check_circle : Icons.cancel,
                        color: isSolved1 ? Colors.green : Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          isSolved1 = !isSolved1;
                        });
                      },
                    ),
                    subtitle: Text(isSolved1 ? 'Solved' : 'Unsolved'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Student Name: XXXXXXX\nStandard: XX\nInquiry Date: XX/XX/XXXX\nInquiry Source: XXXXXXXX'),
                    trailing: IconButton(
                      icon: Icon(
                        isSolved2 ? Icons.check_circle : Icons.cancel,
                        color: isSolved2 ? Colors.green : Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          isSolved2 = !isSolved2;
                        });
                      },
                    ),
                    subtitle: Text(isSolved2 ? 'Solved' : 'Unsolved'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Export action
              },
              child: Text('Export'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StudentDetailReportScreen extends StatefulWidget {
  @override
  _StudentDetailReportScreenState createState() => _StudentDetailReportScreenState();
}

class _StudentDetailReportScreenState extends State<StudentDetailReportScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  // Method to select a date
  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  void _editStudentDetail() {
    // Handle edit action
  }

  void _deleteStudentDetail() {
    // Handle delete action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Detail Report'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      drawer: Drawer(), // Add your drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, fromDate, (date) {
                      setState(() {
                        fromDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        fromDate != null ? DateFormat.yMMMd().format(fromDate!) : 'From Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, toDate, (date) {
                      setState(() {
                        toDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        toDate != null ? DateFormat.yMMMd().format(toDate!) : 'To Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle Get Data action
                  },
                  child: Text('Get Data'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                        'Student Name: XXXXXXX\nStandard: XX\nCourse Name: XXXXXXX\nClass/Batch: XXXXXXX\nJoin Date: XX/XX/XXXX'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: _editStudentDetail,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: _deleteStudentDetail,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                        'Student Name: XXXXXXX\nStandard: XX\nCourse Name: XXXXXXX\nClass/Batch: XXXXXXX\nJoin Date: XX/XX/XXXX'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: _editStudentDetail,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: _deleteStudentDetail,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                        'Student Name: XXXXXXX\nStandard: XX\nCourse Name: XXXXXXX\nClass/Batch: XXXXXXX\nJoin Date: XX/XX/XXXX'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: _editStudentDetail,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: _deleteStudentDetail,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Export action
              },
              child: Text('Export'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentCardReportScreen extends StatefulWidget {
  @override
  _StudentCardReportScreenState createState() => _StudentCardReportScreenState();
}

class _StudentCardReportScreenState extends State<StudentCardReportScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isFromDate ? _fromDate : _toDate))
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Card Report'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality here
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // From Date and To Date
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context, true),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'From Date',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        _fromDate != null
                            ? "${_fromDate!.toLocal()}".split(' ')[0]
                            : 'Select Date',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context, false),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'To Date',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        _toDate != null
                            ? "${_toDate!.toLocal()}".split(' ')[0]
                            : 'Select Date',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Student Card List
            Expanded(
              child: ListView.builder(
                itemCount: 2, // Replace with actual number of students
                itemBuilder: (context, index) {
                  return StudentCard(
                    // Pass student data here
                  );
                },
              ),
            ),

            // Export Button
            ElevatedButton(
              onPressed: () {
                // Implement export functionality here
              },
              child: Text('Export'),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each student card
class StudentCard extends StatelessWidget {
  // Add necessary properties for student data

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Name, Standard, Batch, etc.
            Text('Student Name: XXXXXX'),
            Text('Standard: XX'),
            Text('Batch: XX'),
            Text('Attendance: XX%'),
            Text('Join Date: XX/XX/XX'),

            // Edit and Delete buttons
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement delete functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StudentAttendanceReportScreen extends StatefulWidget {
  @override
  _StudentAttendanceReportScreenState createState() => _StudentAttendanceReportScreenState();
}

class _StudentAttendanceReportScreenState extends State<StudentAttendanceReportScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  // Method to select a date
  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance Report'),
      ),
      drawer: Drawer(), // Add your drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, fromDate, (date) {
                      setState(() {
                        fromDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        fromDate != null ? DateFormat.yMMMd().format(fromDate!) : 'From Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, toDate, (date) {
                      setState(() {
                        toDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        toDate != null ? DateFormat.yMMMd().format(toDate!) : 'To Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle Get Data action
                  },
                  child: Text('Get Data'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('STD')),
                    DataColumn(label: Text('Batch')),
                    DataColumn(label: Text('Attendance')),
                  ],
                  rows: List<DataRow>.generate(
                    5, // Adjust the number based on your data
                        (index) => DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text('Name $index')),
                        DataCell(Text('STD $index')),
                        DataCell(Text('Batch $index')),
                        DataCell(Text('Attendance $index')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Export action
              },
              child: Text('Export'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PendingFeeReportScreen extends StatefulWidget {
  @override
  _PendingFeeReportScreenState createState() => _PendingFeeReportScreenState();
}

class _PendingFeeReportScreenState extends State<PendingFeeReportScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  // Method to select a date
  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Installment Fee Report'),
      ),
      drawer: Drawer(), // Add your drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, fromDate, (date) {
                      setState(() {
                        fromDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        fromDate != null ? DateFormat.yMMMd().format(fromDate!) : 'From Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, toDate, (date) {
                      setState(() {
                        toDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        toDate != null ? DateFormat.yMMMd().format(toDate!) : 'To Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle Get Data action
                  },
                  child: Text('Get Data'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('STD')),
                    DataColumn(label: Text('Batch')),
                    DataColumn(label: Text('Amt')),
                  ],
                  rows: List<DataRow>.generate(
                    5, // Adjust the number based on your data
                        (index) => DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text('Name $index')),
                        DataCell(Text('STD $index')),
                        DataCell(Text('Batch $index')),
                        DataCell(Text('Amt $index')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Export action
              },
              child: Text('Export'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeStatusReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Variable to hold the selected date
    DateTime? selectedDate;

    // Function to show the date picker and update the selected date
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Status Report'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Standard
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Standard',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Course Type
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Course Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Roll No
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Roll No',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Attendance Date
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Attendance Date',
                    hintText: selectedDate != null
                        ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                        : 'Select Date',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // GR. No
            TextFormField(
              decoration: InputDecoration(
                labelText: 'GR. No',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Category
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Group
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Group',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),

            // Search Button
            ElevatedButton(
              onPressed: () {
                // Implement search functionality here
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeCollectionScreen extends StatefulWidget {
  @override
  _FeeCollectionReportScreenState createState() => _FeeCollectionReportScreenState();
}

class _FeeCollectionReportScreenState extends State<FeeCollectionScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  // Method to select a date
  Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Collection Report'),
      ),
      drawer: Drawer(), // Add your drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, fromDate, (date) {
                      setState(() {
                        fromDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        fromDate != null ? DateFormat.yMMMd().format(fromDate!) : 'From Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, toDate, (date) {
                      setState(() {
                        toDate = date;
                      });
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        toDate != null ? DateFormat.yMMMd().format(toDate!) : 'To Date',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle Get Data action
                  },
                  child: Text('Get Data'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('STD')),
                    DataColumn(label: Text('Batch')),
                    DataColumn(label: Text('Amt')),
                  ],
                  rows: List<DataRow>.generate(
                    5, // Adjust the number based on your data
                        (index) => DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text('Name $index')),
                        DataCell(Text('STD $index')),
                        DataCell(Text('Batch $index')),
                        DataCell(Text('Amt $index')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Export action
              },
              child: Text('Export'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
            ),
          ],
        ),
      ),
    );
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
