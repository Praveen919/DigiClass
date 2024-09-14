import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class EstudyScreen extends StatelessWidget {
  final String option;

  const EstudyScreen({this.option = 'createStudyMaterial'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EStudy'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (option) {
      case 'createStudyMaterial':
        return CreateStudyMaterialScreen();
      case 'manageStudyMaterial':
        return ManageStudyMaterialScreen();
      case 'manageSharedStudyMaterial':
        return ManageSharedStudyMaterialScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

class CreateStudyMaterialScreen extends StatefulWidget {
  @override
  _CreateStudyMaterialScreenState createState() => _CreateStudyMaterialScreenState();
}

class _CreateStudyMaterialScreenState extends State<CreateStudyMaterialScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _courseName;
  String? _standard;
  String? _subject;
  File? _file;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  Future<void> _saveStudyMaterial() async {
    if (_formKey.currentState!.validate()) {
      try {
        final uri = Uri.parse('http://192.168.0.102:3000/api/study-material');
        var request = http.MultipartRequest('POST', uri)
          ..fields['courseName'] = _courseName!
          ..fields['standard'] = _standard!
          ..fields['subject'] = _subject!;

        if (_file != null) {
          request.files.add(await http.MultipartFile.fromPath('file', _file!.path));
        }

        final response = await request.send();
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Study material created successfully')),
          );
        } else {
          throw Exception('Failed to create study material');
        }
      } catch (e) {
        print('Error saving study material: $e');
      }
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _courseName = null;
      _standard = null;
      _subject = null;
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Study Material',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField('Course Name *', (value) => _courseName = value),
              SizedBox(height: 16),
              _buildDropdownField('Standard *', (value) => _standard = value),
              SizedBox(height: 16),
              _buildDropdownField('Subject *', (value) => _subject = value),
              SizedBox(height: 16),
              _buildFileUploader(),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveStudyMaterial,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text('SAVE'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text('RESET'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, FormFieldSetter<String> onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, FormFieldSetter<String> onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(
              value: 'option1',
              child: Text('Option 1'),
            ),
            DropdownMenuItem(
              value: 'option2',
              child: Text('Option 2'),
            ),
          ],
          onChanged: (value) {},
          onSaved: onSaved,
          validator: (value) {
            if (value == null) {
              return 'This field is required';
            }
            return null;
          },
          hint: Text('-- Select --'),
        ),
      ],
    );
  }

  Widget _buildFileUploader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload File *',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: _pickFile,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _file != null ? _file!.path.split('/').last : 'No file selected',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Icon(Icons.upload_file, color: Colors.grey[600]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class ManageStudyMaterialScreen extends StatefulWidget {
  @override
  _ManageStudyMaterialScreenState createState() => _ManageStudyMaterialScreenState();
}

class _ManageStudyMaterialScreenState extends State<ManageStudyMaterialScreen> {
  List<dynamic> _studyMaterials = [];

  @override
  void initState() {
    super.initState();
    _fetchStudyMaterials();
  }

  Future<void> _fetchStudyMaterials() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.0.102/api/study-material'));
      if (response.statusCode == 200) {
        setState(() {
          _studyMaterials = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load study materials');
      }
    } catch (e) {
      print('Error fetching study materials: $e');
    }
  }

  Future<void> _deleteStudyMaterial(String id) async {
    try {
      final response = await http.delete(Uri.parse('http://192.168.0.102/api/study-material/$id'));
      if (response.statusCode == 200) {
        _fetchStudyMaterials();
      } else {
        throw Exception('Failed to delete study material');
      }
    } catch (e) {
      print('Error deleting study material: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _studyMaterials.length,
                itemBuilder: (context, index) {
                  final material = _studyMaterials[index];
                  return ListTile(
                    title: Text('Course Name: ${material['courseName']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Standard: ${material['standard']}'),
                        Text('Subject: ${material['subject']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteStudyMaterial(material['_id']);
                          },
                        ),
                      ],
                    ),
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


class ManageSharedStudyMaterialScreen extends StatefulWidget {
  @override
  _ManageSharedStudyMaterialScreenState createState() => _ManageSharedStudyMaterialScreenState();
}

class _ManageSharedStudyMaterialScreenState extends State<ManageSharedStudyMaterialScreen> {
  List<dynamic> _studyMaterials = [];

  @override
  void initState() {
    super.initState();
    _fetchStudyMaterials();
  }

  Future<void> _fetchStudyMaterials() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.0.102/api/study-material'));
      if (response.statusCode == 200) {
        setState(() {
          _studyMaterials = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load study materials');
      }
    } catch (e) {
      print('Error fetching study materials: $e');
    }
  }

  Future<void> _deleteStudyMaterial(String id) async {
    try {
      final response = await http.delete(Uri.parse('http://192.168.0.102/api/study-material/$id'));
      if (response.statusCode == 200) {
        _fetchStudyMaterials();
      } else {
        throw Exception('Failed to delete study material');
      }
    } catch (e) {
      print('Error deleting study material: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _studyMaterials.length,
                itemBuilder: (context, index) {
                  final material = _studyMaterials[index];
                  return ListTile(
                    title: Text('Course Name: ${material['courseName']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Standard: ${material['standard']}'),
                        Text('Subject: ${material['subject']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteStudyMaterial(material['_id']);
                          },
                        ),
                      ],
                    ),
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
