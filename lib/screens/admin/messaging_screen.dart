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
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message to Inquired Students'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message Type (changed to TextFormField)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Message Type*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Title
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Message
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Implement confirmation logic here
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class SendStudentMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message to Students'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message Type (changed to TextFormField)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Message Type*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Title
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Message
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Implement confirmation logic here
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}


class SendStaffMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message to Staff'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message Type (changed to TextFormField)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Message Type*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Title
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Message
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Implement confirmation logic here
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class SendStaffIdPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send ID/Password to Staff'),
      ),
      resizeToAvoidBottomInset: true, // Allows resizing to avoid keyboard
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sample Message Format
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your login details for SRS Classes is: User ID: SCSTD4659 Password: 8X4X564, download app from http://bit.ly/2Cpwr55 Service by, Viha IT Services',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Send Message with Mobile App Link
              DropdownButtonFormField<String>(
                value: '-- Select --',
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Send Message with Mobile App Link',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

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

              // Staff ID/Password Details
              Text('Staff ID/Password Details', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),

              // List of staff details
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1, // Replace with actual number of staff
                itemBuilder: (context, index) {
                  return StaffDetailsCard(
                    // Pass staff data here
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for each staff's details
class StaffDetailsCard extends StatelessWidget {
  // Add necessary properties for staff data

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Staff Name: XXXXXXXXX'),
            Text('User ID: XXXXXXXXX'),
            Text('Password: XXXXXXXXX'),

            // Send Message button
            ElevatedButton(
              onPressed: () {
                // Implement send message functionality
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}


class SendStudentIdPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send ID/Password to Student'),
      ),
      resizeToAvoidBottomInset: true, // Allows resizing to avoid keyboard
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sample Message Format
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your login details for SRS Classes is: User ID: SCSTD4659 Password: 8X4X564, download app from http://bit.ly/2Cpwr55 Service by, Viha IT Services',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Send Message with Mobile App Link
              DropdownButtonFormField<String>(
                value: '-- Select --',
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Send Message with Mobile App Link',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

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

              // Staff ID/Password Details
              Text('Student ID/Password Details', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),

              // List of staff details
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1, // Replace with actual number of staff
                itemBuilder: (context, index) {
                  return StaffDetailsCard(
                    // Pass staff data here
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentDetailsCard extends StatelessWidget {
  // Add necessary properties for staff data

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: XXXXXXXXX'),
            Text('User ID: XXXXXXXXX'),
            Text('Password: XXXXXXXXX'),

            // Send Message button
            ElevatedButton(
              onPressed: () {
                // Implement send message functionality
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}

class SendExamReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Upcoming Exam Message to Student'),
      ),
      resizeToAvoidBottomInset: true, // Ensures proper resizing to avoid keyboard overlap
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Standard
              DropdownButtonFormField<String>(
                value: 'All',
                items: <String>['All', '1st Std', '2nd Std', '3rd Std']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Standard',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Subject
              DropdownButtonFormField<String>(
                value: 'All',
                items: <String>['All', 'English', 'Maths', 'Science', 'Social Science', 'Hindi', 'Marathi']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Exam Name
              DropdownButtonFormField<String>(
                value: '-- Select --',
                items: <String>['English', 'Maths', 'Science', 'Social Science', 'Hindi', 'Marathi']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Exam Name*',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),

              // Confirm Button
              ElevatedButton(
                onPressed: () {
                  // Implement confirmation logic here
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SendExamMarksMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Exam Marks to Student'),
      ),
      resizeToAvoidBottomInset: true, // Ensures proper resizing to avoid keyboard overlap
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Standard
              DropdownButtonFormField<String>(
                value: 'All',
                items: <String>['All', '1st Std', '2nd Std', '3rd Std']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Standard',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Subject
              DropdownButtonFormField<String>(
                value: 'All',
                items: <String>['All', 'English', 'Maths', 'Science', 'Social Science', 'Hindi', 'Marathi']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Exam Name
              DropdownButtonFormField<String>(
                value: '-- Select --',
                items: <String>['English', 'Maths', 'Science', 'Social Science', 'Hindi', 'Marathi']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown selection change
                },
                decoration: InputDecoration(
                  labelText: 'Exam Name*',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32.0),

              // Confirm Button
              ElevatedButton(
                onPressed: () {
                  // Implement confirmation logic here
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SendFeeStatusMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Fee Status Message to Student'),
      ),
      resizeToAvoidBottomInset: true, // Ensures proper resizing to avoid keyboard overlap
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sample Message Format
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Dear John, Your fee status is: Total fees amount - 5000, Total received amount - 1000. Total pending amount - 4000. Thank you, SRS Classes. Service by, Viha IT Services',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

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

              // Students with Pending Fees
              Text('Students with Pending Fees', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),

              // List of students with pending fees
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1, // Replace with actual number of students with pending fees
                itemBuilder: (context, index) {
                  return StudentWithPendingFeeCard(
                    // Pass student data here
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for each student with pending fees
class StudentWithPendingFeeCard extends StatelessWidget {
  // Add necessary properties for student data

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: XXXXXX'),
            Text('Standard: XX'),
            Text('Batch: XX'),

            // Send Message button
            ElevatedButton(
              onPressed: () {
                // Implement send message functionality
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}

class SendFeeReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Fee Reminder to Student'),
      ),
      resizeToAvoidBottomInset: true, // Ensures proper resizing to avoid keyboard overlap
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sample Message Format
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Dear John, Your fee payment is due at SRS Classes. This is a friendly reminder to submit it and ignore it if you already processed it. Total pending amount is 4000. Thank you, SRS Classes. Service by, Viha IT Services',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // With Total Pending Amount
              CheckboxListTile(
                title: Text('With Total Pending Amount'),
                value: false, // Set initial value to false
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
              SizedBox(height: 16.0),

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

              // Students with Pending Fees
              Text('Students with Pending Fees', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),

              // List of students with pending fees
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1, // Replace with actual number of students with pending fees
                itemBuilder: (context, index) {
                  return StudentWithPendingFeeCard(
                    // Pass student data here
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for each student with pending fees
class StudentWithPendingFeeCard1 extends StatelessWidget {
  // Add necessary properties for student data

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: XXXXXX'),
            Text('Standard: XX'),
            Text('Batch: XX'),

            // Send Message button
            ElevatedButton(
              onPressed: () {
                // Implement send message functionality
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}

class SendAbsentAttendanceMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Today Absent Attendance Message'),
      ),
      resizeToAvoidBottomInset: true, // Ensures proper resizing to avoid keyboard overlap
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sample Message Format
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'User1 was absent today at SRS Classes for the batch that starts at 11:30 AM. Thank you, Viha IT Services',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

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

              // Today's Absentees
              Text('Today\'s Absentees', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),

              // List of today's absentees
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1, // Replace with actual number of absent students
                itemBuilder: (context, index) {
                  return AbsentStudentCard(
                    // Pass absent student data here
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for each absent student
class AbsentStudentCard extends StatelessWidget {
  // Add necessary properties for absent student data

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: XXXXXX'),
            Text('Standard: XX'),
            Text('Batch: XX'),

            // Send Message button
            ElevatedButton(
              onPressed: () {
                // Implement send message functionality
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
