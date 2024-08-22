import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ExamScreen extends StatelessWidget {
  final String option;

  ExamScreen({this.option = 'createManualExam'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
      ),
      body: _buildContent(),
    );
  }
  Widget _buildContent() {
    switch (option) {
      case 'createManualExam':
        return CreateManualExamScreen();
      case 'manageManualExam':
        return ManageManualExamScreen();
      case 'createMCQExam':
        return CreateMCQExamScreen();
      case 'manageMCQExam':
        return ManageMCQExamScreen();
      case 'createAssignments':
        return CreateAssignmentsScreen();
      case 'manageAssignments':
        return ManageAssignmentsScreen();

      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

class CreateManualExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Create Manual Exam Screen'));
  }
}

class ManageManualExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Manual Exam Screen'));
  }
}

class CreateMCQExamScreen extends StatefulWidget {
  @override
  _CreateMCQExamScreenState createState() => _CreateMCQExamScreenState();
}

class _CreateMCQExamScreenState extends State<CreateMCQExamScreen> {
  final _formKey = GlobalKey<FormState>();
  String? paperName, standard, subject, examPaperType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create MCQ Exam'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'My Panel',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Manage MCQ Paper',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Text(
                'Create MCQ Paper',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Paper Name *',
                  hintText: 'e.g. English MCQ Paper',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => paperName = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Standard *',
                  hintText: 'e.g. 10th',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => standard = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Subject *',
                  hintText: 'e.g. English',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => subject = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Exam Paper Type *',
                  hintText: 'e.g. Simple/Comprehensive MCQs',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => examPaperType = value,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('SAVE'),
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('RESET'),
                onPressed: _resetForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Navigate to AddMCQQuestionsScreen with the paperName
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _AddMCQQuestionsScreen(paperName: paperName ?? 'Unnamed Paper'),
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
  }
}

class _AddMCQQuestionsScreen extends StatelessWidget {
  final String paperName;

  _AddMCQQuestionsScreen({required this.paperName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add MCQ Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add MCQ Questions for $paperName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            // Add your MCQ question form here
            // Placeholder for now
            Expanded(
              child: Center(
                child: Text(
                  'MCQ Questions Form Placeholder',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageMCQExamScreen extends StatefulWidget {
  @override
  _ManageMCQExamScreenState createState() => _ManageMCQExamScreenState();
}

class _ManageMCQExamScreenState extends State<ManageMCQExamScreen> {
  // Sample data - replace with actual data source
  final List<Map<String, String>> exams = [
    {
      'name': 'XXXXXX',
      'standard': 'XX',
      'subject': 'XXXXXX',
      'timeLimit': 'XXX',
      'examDate': 'XX/XX/XX',
      'dueDate': 'XX/XX/XX',
    },
    // Add more exam entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Panel'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implement settings functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Text(
              'Manage MCQ Exam',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text('${index + 1}. Exam Name: ${exam['name']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Standard: ${exam['standard']}'),
                        Text('Subject: ${exam['subject']}'),
                        Text('Time Limit: ${exam['timeLimit']}'),
                        Text('Exam Date: ${exam['examDate']}'),
                        Text('Due Date: ${exam['dueDate']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CreateAssignmentsScreen extends StatefulWidget {
  @override
  _CreateAssignmentsScreenState createState() => _CreateAssignmentsScreenState();
}

class _CreateAssignmentsScreenState extends State<CreateAssignmentsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? standard, subject, assignmentName, dueDate;
  String? fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Panel'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Navigate to home screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Open settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create Assignment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Create Assignment',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Standard *',
                  hintText: 'e.g. 10th',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => standard = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Subject *',
                  hintText: 'e.g. English',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => subject = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Assignment Name *',
                  hintText: 'e.g. English Assignment 1',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => assignmentName = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Due Date *',
                  hintText: 'e.g. 24th June 2024',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => dueDate = value,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: Text('Choose File'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      fileName ?? 'No File Chosen',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('SAVE'),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // TODO: Implement save functionality
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('RESET'),
                onPressed: () {
                  _formKey.currentState?.reset();
                  setState(() {
                    fileName = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManageAssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Assignments Screen'));
  }
}
