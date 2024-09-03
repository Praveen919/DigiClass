import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

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

class ManageStudentInquiryScreen extends StatefulWidget {
  @override
  _ManageStudentInquiryScreenState createState() => _ManageStudentInquiryScreenState();
}

class _ManageStudentInquiryScreenState extends State<ManageStudentInquiryScreen> {
  // Example list of inquiries
  List<Inquiry> inquiries = [
    Inquiry(name: 'John Doe', standard: 'Standard 1', date: '01/09/2024', source: 'Website'),
    // Add more inquiries here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Inquiry List'),
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

            // Student Inquiry List
            Expanded(
              child: ListView.builder(
                itemCount: inquiries.length,
                itemBuilder: (context, index) {
                  return StudentInquiryCard(
                    inquiry: inquiries[index],
                    onSolvedChanged: (bool? value) {
                      // Handle mark as solved functionality
                      setState(() {
                        inquiries[index].isSolved = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for Inquiry
class Inquiry {
  final String name;
  final String standard;
  final String date;
  final String source;
  bool isSolved;

  Inquiry({
    required this.name,
    required this.standard,
    required this.date,
    required this.source,
    this.isSolved = false,
  });
}

// Custom widget for each student inquiry
class StudentInquiryCard extends StatelessWidget {
  final Inquiry inquiry;
  final ValueChanged<bool?> onSolvedChanged;

  StudentInquiryCard({
    required this.inquiry,
    required this.onSolvedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: ${inquiry.name}'),
            Text('Standard: ${inquiry.standard}'),
            Text('Inquiry Date: ${inquiry.date}'),
            Text('Inquiry Source: ${inquiry.source}'),

            // Mark as Solved checkbox
            CheckboxListTile(
              title: Text('Mark as Solved'),
              value: inquiry.isSolved,
              onChanged: onSolvedChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class ImportStudentsScreen extends StatefulWidget {
  @override
  _ImportStudentsScreenState createState() => _ImportStudentsScreenState();
}

class _ImportStudentsScreenState extends State<ImportStudentsScreen> {
  String _fileName = 'No File Chosen'; // State variable to hold the file name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Import Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note
            Text(
              'NOTE: Upload your existing students from excel file.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),

            // Import Student
            Text(
              'Import Student',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),

            // Click Here to download excel file format
            ElevatedButton(
              onPressed: () {
                // Implement download functionality here
              },
              child: Text('Click Here to download excel file format'),
            ),
            SizedBox(height: 16.0),

            // Standard
            DropdownButtonFormField<String>(
              value: '-- Select --',
              items: <String>['Standard 1', 'Standard 2', 'Standard 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: InputDecoration(
                labelText: 'Standard *',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Course Type
            DropdownButtonFormField<String>(
              value: '-- Select --',
              items: <String>['Course Type 1', 'Course Type 2', 'Course Type 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: InputDecoration(
                labelText: 'Course Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Class/Batch
            DropdownButtonFormField<String>(
              value: '-- Select --',
              items: <String>['Class/Batch 1', 'Class/Batch 2', 'Class/Batch 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: InputDecoration(
                labelText: 'Class/Batch *',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Upload Excel File
            ElevatedButton(
              onPressed: () async {
                // Open file picker
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx'],
                );

                if (result != null) {
                  PlatformFile file = result.files.first;

                  setState(() {
                    _fileName = file.name;
                  });

                  // Process the file if needed
                } else {
                  // User canceled the picker
                  setState(() {
                    _fileName = 'No File Chosen';
                  });
                }
              },
              child: Text('Choose File'),
            ),
            SizedBox(height: 8.0),
            Text(_fileName), // Display the chosen file name
            SizedBox(height: 32.0),

            // Reset and Submit buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement reset functionality
                  },
                  child: Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement submit functionality
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddStudentRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add Student Registration Screen'));
  }
}

class ManageStudentScreen extends StatefulWidget {
  @override
  _ManageStudentScreenState createState() => _ManageStudentScreenState();
}

class _ManageStudentScreenState extends State<ManageStudentScreen> {
  // Example list of students
  List<Student> students = [
    Student(name: 'John Doe', standard: 'Standard 1', course: 'Math', classBatch: 'Batch A', joinDate: '01/09/2023'),
    // Add more students here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
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

            // Student List
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return StudentCard(
                    student: students[index],
                    onEdit: () {
                      // Implement edit functionality
                      _showEditDialog(context, students[index]);
                    },
                    onDelete: () {
                      // Implement delete functionality
                      setState(() {
                        students.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Student student) {
    // Show a dialog to edit student information
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: student.name),
                decoration: InputDecoration(labelText: 'Student Name'),
                onChanged: (value) {
                  student.name = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.standard),
                decoration: InputDecoration(labelText: 'Standard'),
                onChanged: (value) {
                  student.standard = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.course),
                decoration: InputDecoration(labelText: 'Course Name'),
                onChanged: (value) {
                  student.course = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.classBatch),
                decoration: InputDecoration(labelText: 'Class/Batch'),
                onChanged: (value) {
                  student.classBatch = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.joinDate),
                decoration: InputDecoration(labelText: 'Join Date'),
                onChanged: (value) {
                  student.joinDate = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

// Model class for Student
class Student {
  String name;
  String standard;
  String course;
  String classBatch;
  String joinDate;

  Student({
    required this.name,
    required this.standard,
    required this.course,
    required this.classBatch,
    required this.joinDate,
  });
}

// Custom widget for each student
class StudentCard extends StatelessWidget {
  final Student student;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  StudentCard({
    required this.student,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: ${student.name}'),
            Text('Standard: ${student.standard}'),
            Text('Course Name: ${student.course}'),
            Text('Class/Batch: ${student.classBatch}'),
            Text('Join Date: ${student.joinDate}'),

            // Edit and Delete buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AssignClassBatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Assign Class/Batch Screen'));
  }
}

class StudentAttendanceScreen extends StatefulWidget {
  @override
  _StudentAttendanceScreenState createState() => _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  // Initialize date variables with current date
  String _selectedMonth = DateFormat('MMMM').format(DateTime.now());
  String _day = DateFormat('d').format(DateTime.now());
  String _year = DateFormat('y').format(DateTime.now());
  bool _displayClassBatch = false;
  String? _selectedClassBatch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Student Attendance'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Take Student Attendance
            Text('Take Student Attendance', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),

            // Attendance Date
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedMonth,
                    items: <String>[
                      'January', 'February', 'March', 'April', 'May', 'June',
                      'July', 'August', 'September', 'October', 'November', 'December'
                    ].map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    )).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedMonth = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Month',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Day',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    initialValue: _day,
                    onChanged: (value) {
                      setState(() {
                        _day = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Year',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    initialValue: _year,
                    onChanged: (value) {
                      setState(() {
                        _year = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Display my Class/Batch (Time table wise)
            CheckboxListTile(
              title: Text('Display my Class/Batch(Time table wise)'),
              value: _displayClassBatch,
              onChanged: (bool? value) {
                setState(() {
                  _displayClassBatch = value!;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Class/Batch
            DropdownButtonFormField<String>(
              value: _selectedClassBatch,
              hint: Text('-- Select --'),
              items: <String>[
                'Class/Batch 1', 'Class/Batch 2', 'Class/Batch 3'
              ].map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              )).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClassBatch = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Class/Batch*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),

            // Take Attendance Button
            ElevatedButton(
              onPressed: () {
                // Implement take attendance functionality
              },
              child: Text('Take Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}


class ShareDocumentsScreen extends StatefulWidget {
  @override
  _ShareDocumentsScreenState createState() => _ShareDocumentsScreenState();
}

class _ShareDocumentsScreenState extends State<ShareDocumentsScreen> {
  // Variables to hold selected values
  String _selectedStandard = '-- Select --';
  String _selectedShareOption = '-- Select --';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Documents'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selection
            Text('Selection', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),

            // Select Standard to Share Document
            DropdownButtonFormField<String>(
              value: _selectedStandard,
              items: <String>['-- Select --', 'Standard 1', 'Standard 2', 'Standard 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStandard = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Standard To Share Document',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // How Would You Like To Share Document
            DropdownButtonFormField<String>(
              value: _selectedShareOption,
              items: <String>['-- Select --', 'Option 1', 'Option 2', 'Option 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedShareOption = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'How Would You Like To Share Document',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Implement confirmation logic here
                if (_selectedStandard == '-- Select --' || _selectedShareOption == '-- Select --') {
                  // Show error or perform validation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select all required options')),
                  );
                } else {
                  // Proceed with confirmation logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Document sharing confirmed')),
                  );
                }
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageSharedDocumentsScreen extends StatefulWidget {
  @override
  _ManageSharedDocumentsScreenState createState() => _ManageSharedDocumentsScreenState();
}

class _ManageSharedDocumentsScreenState extends State<ManageSharedDocumentsScreen> {
  // Dummy data for the shared documents list
  final List<Map<String, String>> _sharedDocuments = [
    {'standard': 'Standard 1', 'document': 'Document1.pdf'},
    {'standard': 'Standard 2', 'document': 'Document2.docx'},
    // Add more documents here
  ];

  void _editDocument(int index) {
    // Navigate to an edit screen or show a dialog to edit the document
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Document'),
          content: Text('Editing document: ${_sharedDocuments[index]['document']}'),
          actions: [
            TextButton(
              onPressed: () {
                // Implement save functionality
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteDocument(int index) {
    // Implement delete functionality
    setState(() {
      _sharedDocuments.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Document deleted')),
    );
  }

  void _viewDocument(int index) {
    // Navigate to a view screen or show a dialog to view the document
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('View Document'),
          content: Text('Viewing document: ${_sharedDocuments[index]['document']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Shared Documents'),
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

            // Shared Documents List
            Expanded(
              child: ListView.builder(
                itemCount: _sharedDocuments.length,
                itemBuilder: (context, index) {
                  return SharedDocumentCard(
                    documentData: _sharedDocuments[index],
                    onEdit: () => _editDocument(index),
                    onDelete: () => _deleteDocument(index),
                    onView: () => _viewDocument(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each shared document
class SharedDocumentCard extends StatelessWidget {
  final Map<String, String> documentData;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onView;

  const SharedDocumentCard({
    Key? key,
    required this.documentData,
    required this.onEdit,
    required this.onDelete,
    required this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Standard: ${documentData['standard']}'),
            Text('Document Shared: ${documentData['document']}'),

            // Edit, Delete, and View buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
                IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: onView,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWithStudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat With Students'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add New Chat
            Text('Add New Chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 16.0),

            // Subject/Topic
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Subject/Topic*',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 16.0),

            // Student Name
            DropdownButtonFormField<String>(
              value: null, // Changed to null to show default prompt
              items: <String>['Student 1', 'Student 2', 'Student 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: InputDecoration(
                labelText: 'Student Name*',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 16.0),

            // Message
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message*',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 32.0),

            // Send and Cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement send message functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Custom background color
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: Text('Send', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement cancel functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // Custom background color
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: Text('Cancel', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class StudentsFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Feedback List'),
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
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 16.0),

            // Student Feedback List
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Replace with actual number of feedback
                itemBuilder: (context, index) {
                  return StudentFeedbackCard(
                    // Pass feedback data here
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each student feedback
class StudentFeedbackCard extends StatelessWidget {
  // Add necessary properties for feedback data

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0), // Adds vertical spacing between cards
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student Name: XXXXXX',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Subject: XXXXXXXXXX',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Feedback: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16.0),

            // Action buttons (optional)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement view details functionality
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StudentRightsScreen extends StatefulWidget {
  @override
  _StudentRightsScreenState createState() => _StudentRightsScreenState();
}

class _StudentRightsScreenState extends State<StudentRightsScreen> {
  // Lists to hold the items for activities and reports
  List<String> activities = ['Time Table', 'My Document', 'eStudy', 'MCQ Exam', 'My Class', 'Chat With Tutor', 'Feedback'];
  List<String> reports = ['Attendance Report', 'Exam Performance Summary Report', 'Exam Detail Report', 'Fee Status Report'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Rights'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assign Student Rights
            Text('Assign Student Rights', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),

            // My Activity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Activity', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showAddItemDialog(context, 'Activity');
                  },
                ),
              ],
            ),
            Column(
              children: activities.map((activity) {
                return CheckboxListTile(
                  title: Text(activity),
                  value: false, // Set initial value to false
                  onChanged: (bool? value) {
                    // Handle checkbox change
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),

            // Reports
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reports', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showAddItemDialog(context, 'Report');
                  },
                ),
              ],
            ),
            Column(
              children: reports.map((report) {
                return CheckboxListTile(
                  title: Text(report),
                  value: false, // Set initial value to false
                  onChanged: (bool? value) {
                    // Handle checkbox change
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 32.0),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
                _saveChanges();
              },
              child: Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, String type) {
    final TextEditingController _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New $type'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter $type'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  if (type == 'Activity') {
                    activities.add(_controller.text);
                  } else {
                    reports.add(_controller.text);
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _saveChanges() {
    // Implement the logic to save the changes
    // For example, you could send the updated lists to a server or save them locally
    print('Activities: $activities');
    print('Reports: $reports');
  }
}

class AppAccessRightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('App. Access Rights Screen'));
  }
}
