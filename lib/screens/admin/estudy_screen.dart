import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class EstudyScreen extends StatelessWidget {
  final String option;

  EstudyScreen({this.option = 'createStudyMaterial'});

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
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Study Material',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildTextField('Course Name *'),
            SizedBox(height: 16),
            _buildDropdownField('Standard *', '-- Select --'),
            SizedBox(height: 16),
            _buildDropdownField('Subject *', '-- Select --'),
            SizedBox(height: 16),
            _buildFileUploader(),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('SAVE'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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
    );
  }

  Widget _buildTextField(String label) {
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
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint) {
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
          hint: Text(hint),
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
                  _fileName ?? 'No file selected',
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

class ManageStudyMaterialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Study Material'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
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
                itemCount: 1, // Replace with actual study material data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Course Name: XXXXXX'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Standard: XX'),
                        Text('Subject: XXXXXX'),
                        Text('Order No.: XXXXXX'),
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
                  // Handle delete action
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

class ManageSharedStudyMaterialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Shared Study Material'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
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
                itemCount: 1, // Replace with actual study material data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Course Name: XXXXXX'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Standard: XX'),
                        Text('Subject: XXXXXX'),
                        Text('Order No.: XXXXXX'),
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
                  // Handle delete action
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
