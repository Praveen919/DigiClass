import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StudentScreen extends StatefulWidget {
  final String option;

  const StudentScreen({super.key, required this.option});

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.option) {
      case 'addInquiry':
        return const AddStudentInquiryScreen();
      case 'manageInquiry':
        return const ManageStudentInquiryScreen();
      case 'importStudents':
        return const ImportStudentsScreen();
      case 'addRegistration':
        return const AddStudentRegistrationScreen();
      case 'manageStudent':
        return const ManageStudentScreen();
      case 'assignClassBatch':
        return const AssignClassBatchScreen();
      case 'studentAttendance':
        return const StudentAttendanceScreen();
      case 'shareDocuments':
        return const ShareDocumentsScreen();
      case 'manageSharedDocuments':
        return const ManageSharedDocumentsScreen();
      case 'chatWithStudents':
        return const ChatWithStudentsScreen();
      case 'studentsFeedback':
        return const StudentsFeedbackScreen();
      case 'studentRights':
        return const StudentRightsScreen();
      case 'appAccessRights':
        return const AppAccessRightsScreen();
      default:
        return const Center(child: Text('Unknown Option'));
    }
  }
}

// Below are the placeholder widgets for each student-related screen.
// Replace these with your actual implementation.

class AddStudentInquiryScreen extends StatefulWidget {
  const AddStudentInquiryScreen({super.key});

  @override
  _AddStudentInquiryScreenState createState() => _AddStudentInquiryScreenState();
}

class _AddStudentInquiryScreenState extends State<AddStudentInquiryScreen> {
  DateTime _selectedDate = DateTime.now();
  String? _fileName;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'], // Allow image formats
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Action for 'Import Inquiry'
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text('Import Inquiry'),
            ),
          ),
        ],
      ),
      // No Drawer or title

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Student Inquiry Registration', // Updated heading
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildPersonalDetailsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        Divider(thickness: 1.5, color: Colors.grey[300]),
        const SizedBox(height: 10),
        _buildTextField('Student Name *'), // Added 'Student Name *' field
        _buildDropdownField('Gender', ['Male', 'Female', 'Other'], isRequired: true),
        _buildTextField('Father Mobile'),
        _buildTextField('Mother Mobile'),
        _buildTextField('Student Mobile'),
        _buildTextField('Student Email'),
        _buildTextField('School / College'),
        _buildTextField('University'),
        _buildDropdownField('Standard', ['Class 1', 'Class 2', 'Class 3'], isRequired: true),
        _buildDropdownField('Course Type', ['Type 1', 'Type 2'], isRequired: true),
        _buildTextField('Reference By'),
        _buildFilePicker(), // Profile Picture
        _buildDatePicker(context), // Inquiry Date
        _buildTextField('Inquiry Source'),
        _buildTextArea('Inquiry'),
        _buildSaveAndResetButtons(),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> options, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: isRequired ? '$label *' : label,
                border: const OutlineInputBorder(),
              ),
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                // Handle change
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: isRequired ? '$label *' : label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildTextArea(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        maxLines: 4,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: _pickFile,
            child: const Text('Choose File'),
          ),
          const SizedBox(width: 16.0),
          Text(_fileName ?? 'No file chosen'),
        ],
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Inquiry Date',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd-MM-yyyy').format(_selectedDate)),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveAndResetButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle Save action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Save', style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle Reset action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Reset', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
class ManageStudentInquiryScreen extends StatefulWidget {
  const ManageStudentInquiryScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality here
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),

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

  const StudentInquiryCard({super.key, 
    required this.inquiry,
    required this.onSolvedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Name: ${inquiry.name}'),
            Text('Standard: ${inquiry.standard}'),
            Text('Inquiry Date: ${inquiry.date}'),
            Text('Inquiry Source: ${inquiry.source}'),

            // Mark as Solved checkbox
            CheckboxListTile(
              title: const Text('Mark as Solved'),
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
  const ImportStudentsScreen({super.key});

  @override
  _ImportStudentsScreenState createState() => _ImportStudentsScreenState();
}

class _ImportStudentsScreenState extends State<ImportStudentsScreen> {
  String _fileName = 'No File Chosen'; // State variable to hold the file name

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note
            const Text(
              'NOTE: Upload your existing students from excel file.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // Import Student
            const Text(
              'Import Student',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // Click Here to download excel file format
            ElevatedButton(
              onPressed: () {
                // Implement download functionality here
              },
              child: const Text('Click Here to download excel file format'),
            ),
            const SizedBox(height: 16.0),

            // Standard
            DropdownButtonFormField<String>(
              value: '-- Select --',
              items: <String>['-- Select --', 'Standard 1', 'Standard 2', 'Standard 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: const InputDecoration(
                labelText: 'Standard *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Course Type
            DropdownButtonFormField<String>(
              value: '-- Select --',
              items: <String>['-- Select --', 'Course Type 1', 'Course Type 2', 'Course Type 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: const InputDecoration(
                labelText: 'Course Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Class/Batch
            DropdownButtonFormField<String>(
              value: '-- Select --',
              items: <String>['-- Select --', 'Class/Batch 1', 'Class/Batch 2', 'Class/Batch 3']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection change
              },
              decoration: const InputDecoration(
                labelText: 'Class/Batch *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

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
              child: const Text('Choose File'),
            ),
            const SizedBox(height: 8.0),
            Text(_fileName), // Display the chosen file name
            const SizedBox(height: 32.0),

            // Reset and Submit buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement reset functionality
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement submit functionality
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddStudentRegistrationScreen extends StatefulWidget {
  const AddStudentRegistrationScreen({super.key});

  @override
  _AddStudentRegistrationScreenState createState() => _AddStudentRegistrationScreenState();
}

class _AddStudentRegistrationScreenState extends State<AddStudentRegistrationScreen> {
  DateTime _selectedBirthDate = DateTime.now();
  DateTime _selectedJoinDate = DateTime.now();
  bool _printInquiry = false;
  File? _selectedImage;
  String? _fileName = 'No file chosen';

  Future<void> _selectDate(BuildContext context, bool isBirthDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isBirthDate ? _selectedBirthDate : _selectedJoinDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isBirthDate) {
          _selectedBirthDate = picked;
        } else {
          _selectedJoinDate = picked;
        }
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _fileName = pickedFile.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back arrow
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Action for 'Registration Form' button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text('Registration Form'),
            ),
          ),
        ],
      ),
      // No title and no back arrow
  body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create Student Registration',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildPersonalDetailsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        Divider(thickness: 1.5, color: Colors.grey[300]),
        const SizedBox(height: 10),
        _buildImagePicker('Profile Picture'),
        _buildTextField('First Name *'),
        _buildTextField('Middle Name'),
        _buildTextField('Last Name *'),
        _buildDropdownField('Gender *', ['Male', 'Female', 'Other']),
        _buildDatePickerField('Birth Date *', true),
        _buildTextField('Father Name'),
        _buildTextField('Mother Name'),
        _buildTextField('Father Mobile'),
        _buildTextField('Mother Mobile'),
        _buildTextField('Student Mobile'),
        _buildTextField('Student Email'),
        _buildTextField('Address'),
        _buildTextField('State'),
        _buildTextField('City'),
        _buildTextField('School/College'),
        _buildTextField('University'),
        _buildDropdownField('Standard *', ['-- Select --', '1st', '2nd', '11th', '12th']),
        _buildDropdownField('Course Type *', ['-- Select --', 'Type1', 'Type2', 'Other']),
        _buildTextField('Class/Batch'),
        _buildDatePickerField('Join Date', false),
        _buildCheckbox('Do you want to print the submitted student\'s inquiry?'),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Save'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle reset action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (value) {
          // Handle change
        },
      ),
    );
  }

  Widget _buildDatePickerField(String label, bool isBirthDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          _selectDate(context, isBirthDate);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${isBirthDate ? _selectedBirthDate.toLocal() : _selectedJoinDate.toLocal()}".split(' ')[0],
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                child: const Text('Choose File'),
              ),
              const SizedBox(width: 10),
              Text(_fileName ?? 'No file chosen', style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          _selectedImage != null
              ? Image.file(_selectedImage!, height: 100, width: 100, fit: BoxFit.cover)
              : Container(),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String label) {
    return CheckboxListTile(
      title: Text(label),
      value: _printInquiry,
      onChanged: (bool? value) {
        setState(() {
          _printInquiry = value ?? false;
        });
      },
    );
  }
}
class ManageStudentScreen extends StatefulWidget {
  const ManageStudentScreen({super.key});

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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality here
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),

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
          title: const Text('Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: student.name),
                decoration: const InputDecoration(labelText: 'Student Name'),
                onChanged: (value) {
                  student.name = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.standard),
                decoration: const InputDecoration(labelText: 'Standard'),
                onChanged: (value) {
                  student.standard = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.course),
                decoration: const InputDecoration(labelText: 'Course Name'),
                onChanged: (value) {
                  student.course = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.classBatch),
                decoration: const InputDecoration(labelText: 'Class/Batch'),
                onChanged: (value) {
                  student.classBatch = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: student.joinDate),
                decoration: const InputDecoration(labelText: 'Join Date'),
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
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
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

  const StudentCard({super.key, 
    required this.student,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  icon: const Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
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
  const AssignClassBatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Assign Class/Batch to Student',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Total Strength:-'),
            const Text('Availability:-'),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              // This container would typically contain a list of classes/batches
            ),
            const SizedBox(height: 16),
            const Text(
              'Assigned Student:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              // This container would typically contain a list of assigned students
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Assign Class/Batch To Student'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Remove Student From Class/Batch'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Take Student Attendance', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),

            // Attendance Date
            Row(
              children: [
                Flexible(
                  flex: 3,  // Adjust the flex ratio to give more space to the month dropdown
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
                    decoration: const InputDecoration(
                      labelText: 'Month',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Reduced width
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    decoration: const InputDecoration(
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
                const SizedBox(width: 8.0), // Reduced width
                Flexible(
                  flex: 2, // Slightly more space for year
                  child: TextFormField(
                    decoration: const InputDecoration(
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
            const SizedBox(height: 16.0),

            // Display my Class/Batch (Time table wise)
            CheckboxListTile(
              title: const Text('Display my Class/Batch(Time table wise)'),
              value: _displayClassBatch,
              onChanged: (bool? value) {
                setState(() {
                  _displayClassBatch = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Class/Batch
            DropdownButtonFormField<String>(
              value: _selectedClassBatch,
              hint: const Text('-- Select --'),
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
              decoration: const InputDecoration(
                labelText: 'Class/Batch*',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),

            // Take Attendance Button
            ElevatedButton(
              onPressed: () {
                // Implement take attendance functionality
              },
              child: const Text('Take Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}



class ShareDocumentsScreen extends StatefulWidget {
  const ShareDocumentsScreen({super.key});

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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selection
            const Text('Selection', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),

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
              decoration: const InputDecoration(
                labelText: 'Select Standard To Share Document',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

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
              decoration: const InputDecoration(
                labelText: 'How Would You Like To Share Document',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Implement confirmation logic here
                if (_selectedStandard == '-- Select --' || _selectedShareOption == '-- Select --') {
                  // Show error or perform validation
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select all required options')),
                  );
                } else {
                  // Proceed with confirmation logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Document sharing confirmed')),
                  );
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageSharedDocumentsScreen extends StatefulWidget {
  const ManageSharedDocumentsScreen({super.key});

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
          title: const Text('Edit Document'),
          content: Text('Editing document: ${_sharedDocuments[index]['document']}'),
          actions: [
            TextButton(
              onPressed: () {
                // Implement save functionality
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
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
      const SnackBar(content: Text('Document deleted')),
    );
  }

  void _viewDocument(int index) {
    // Navigate to a view screen or show a dialog to view the document
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('View Document'),
          content: Text('Viewing document: ${_sharedDocuments[index]['document']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality here
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),

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
    super.key,
    required this.documentData,
    required this.onEdit,
    required this.onDelete,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  icon: const Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDelete,
                ),
                IconButton(
                  icon: const Icon(Icons.visibility),
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
  const ChatWithStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Chat With Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add New Chat
            const Text('Add New Chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16.0),

            // Subject/Topic
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Subject/Topic*',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            const SizedBox(height: 16.0),

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
              decoration: const InputDecoration(
                labelText: 'Student Name*',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            const SizedBox(height: 16.0),

            // Message
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Message*',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            const SizedBox(height: 32.0),

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
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text('Send', style: TextStyle(fontSize: 16)),
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
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text('Cancel', style: TextStyle(fontSize: 16)),
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
  const StudentsFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Student Feedback List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality here
                  },
                ),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            const SizedBox(height: 16.0),

            // Student Feedback List
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Replace with actual number of feedback
                itemBuilder: (context, index) {
                  return const StudentFeedbackCard(
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
  const StudentFeedbackCard({super.key});

  // Add necessary properties for feedback data

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Adds vertical spacing between cards
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Name: XXXXXX',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Subject: XXXXXXXXXX',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Feedback: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16.0),

            // Action buttons (optional)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement view details functionality
                  },
                  child: const Text('View Details'),
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
  const StudentRightsScreen({super.key});

  @override
  _StudentRightsScreenState createState() => _StudentRightsScreenState();
}

class _StudentRightsScreenState extends State<StudentRightsScreen> {
  // Maps to hold the checked state for each item
  Map<String, bool> _activityChecks = {
    'Time Table': false,
    'My Document': false,
    'eStudy': false,
    'MCQ Exam': false,
    'My Class': false,
    'Chat With Tutor': false,
    'Feedback': false,
  };

  Map<String, bool> _reportChecks = {
    'Attendance Report': false,
    'Exam Performance Summary Report': false,
    'Exam Detail Report': false,
    'Fee Status Report': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Student Rights'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assign Student Rights
            const Text('Assign Student Rights', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),

            // My Activity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('My Activity', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showAddItemDialog(context, 'Activity');
                  },
                ),
              ],
            ),
            Column(
              children: _activityChecks.keys.map((activity) {
                return CheckboxListTile(
                  title: Text(activity),
                  value: _activityChecks[activity],
                  onChanged: (bool? value) {
                    setState(() {
                      _activityChecks[activity] = value!;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),

            // Reports
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Reports', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showAddItemDialog(context, 'Report');
                  },
                ),
              ],
            ),
            Column(
              children: _reportChecks.keys.map((report) {
                return CheckboxListTile(
                  title: Text(report),
                  value: _reportChecks[report],
                  onChanged: (bool? value) {
                    setState(() {
                      _reportChecks[report] = value!;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 32.0),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
                _saveChanges();
              },
              child: const Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, String type) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New $type'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter $type'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  if (type == 'Activity') {
                    _activityChecks[controller.text] = false;
                  } else {
                    _reportChecks[controller.text] = false;
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
    // For example, you could send the updated maps to a server or save them locally
    print('Activities: $_activityChecks');
    print('Reports: $_reportChecks');
  }
}

class AppAccessRightsScreen extends StatefulWidget {
  const AppAccessRightsScreen({Key? key}) : super(key: key);

  @override
  _AppAccessRightsScreenState createState() => _AppAccessRightsScreenState();
}

class _AppAccessRightsScreenState extends State<AppAccessRightsScreen> {
  String selectedRights = 'Admin';
  List<String> users = ['User-1 Name', 'User-2 Name', 'User-3 Name'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'App Access Rights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Check App Access Rights'),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text('Check Rights:', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile(
              title: const Text('Check Admin Rights'),
              value: 'Admin',
              groupValue: selectedRights,
              onChanged: (value) => setState(() => selectedRights = value.toString()),
            ),
            RadioListTile(
              title: const Text('Check Teacher Rights'),
              value: 'Teacher',
              groupValue: selectedRights,
              onChanged: (value) => setState(() => selectedRights = value.toString()),
            ),
            RadioListTile(
              title: const Text('Check Student Rights'),
              value: 'Student',
              groupValue: selectedRights,
              onChanged: (value) => setState(() => selectedRights = value.toString()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Check Rights'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
            const SizedBox(height: 16),
            const Text('Users with Admin Rights:', style: TextStyle(fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('U${index + 1}')),
                  title: Text(users[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                      IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Update'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
