import 'package:flutter/material.dart';

class FeeScreen extends StatelessWidget {
  final String option;

  FeeScreen({this.option = 'createFeeStructure'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (option) {
      case 'createFeeStructure':
        return CreateFeeStructureScreen();
      case 'manageFeeStructure':
        return ManageFeeStructureScreen();
      case 'feeCollection':
        return FeeCollectionScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

class CreateFeeStructureScreen extends StatefulWidget {
  @override
  _CreateFeeStructureScreenState createState() => _CreateFeeStructureScreenState();
}

class _CreateFeeStructureScreenState extends State<CreateFeeStructureScreen> {
  String? selectedStandard;
  String? selectedCourseType;
  String feeAmount = '';
  String remark = '';

  final List<Map<String, String>> feeStructures = [];

  void _saveFeeStructure() {
    setState(() {
      feeStructures.add({
        'standard': selectedStandard ?? '',
        'courseType': selectedCourseType ?? '',
        'feeAmount': feeAmount,
        'remark': remark,
      });
    });
  }

  void _resetForm() {
    setState(() {
      selectedStandard = null;
      selectedCourseType = null;
      feeAmount = '';
      remark = '';
    });
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
              'Create Fee Structure',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildDropdownField('Standard *', '-- Select --', (value) {
              selectedStandard = value;
            }),
            SizedBox(height: 16),
            _buildDropdownField('Course Type *', '-- Select --', (value) {
              selectedCourseType = value;
            }),
            SizedBox(height: 16),
            _buildTextField('Fee Amount *', (value) {
              feeAmount = value;
            }),
            SizedBox(height: 16),
            _buildTextField('Remark:', (value) {
              remark = value;
            }),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveFeeStructure,
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
    );
  }

  Widget _buildDropdownField(String label, String hint, Function(String?) onChanged) {
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
              value: 'Standard 1',
              child: Text('Standard 1'),
            ),
            DropdownMenuItem(
              value: 'Standard 2',
              child: Text('Standard 2'),
            ),
          ],
          onChanged: onChanged,
          hint: Text(hint),
          value: selectedStandard,
        ),
      ],
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
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
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class ManageFeeStructureScreen extends StatefulWidget {
  @override
  _ManageFeeStructureScreenState createState() => _ManageFeeStructureScreenState();
}

class _ManageFeeStructureScreenState extends State<ManageFeeStructureScreen> {
  List<Map<String, String>> feeStructures = [
    {'standard': 'Standard 1', 'courseType': 'Type 1', 'feeAmount': '1000'},
    {'standard': 'Standard 2', 'courseType': 'Type 2', 'feeAmount': '2000'},
  ];

  void _editFeeStructure(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFeeStructureScreen(
          feeStructure: feeStructures[index],
          onSave: (updatedFeeStructure) {
            setState(() {
              feeStructures[index] = updatedFeeStructure;
            });
          },
        ),
      ),
    );
  }

  void _deleteFeeStructure(int index) {
    setState(() {
      feeStructures.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: feeStructures.length,
        itemBuilder: (context, index) {
          final feeStructure = feeStructures[index];
          return Card(
            child: ListTile(
              title: Text(
                'Standard: ${feeStructure['standard']}\n'
                    'Course Type: ${feeStructure['courseType']}\n'
                    'Fee Amount: ${feeStructure['feeAmount']}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editFeeStructure(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteFeeStructure(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EditFeeStructureScreen extends StatefulWidget {
  final Map<String, String> feeStructure;
  final void Function(Map<String, String>) onSave;

  EditFeeStructureScreen({required this.feeStructure, required this.onSave});

  @override
  _EditFeeStructureScreenState createState() => _EditFeeStructureScreenState();
}

class _EditFeeStructureScreenState extends State<EditFeeStructureScreen> {
  late String selectedStandard;
  late String selectedCourseType;
  late String feeAmount;

  @override
  void initState() {
    super.initState();
    selectedStandard = widget.feeStructure['standard']!;
    selectedCourseType = widget.feeStructure['courseType']!;
    feeAmount = widget.feeStructure['feeAmount']!;
  }

  void _saveChanges() {
    widget.onSave({
      'standard': selectedStandard,
      'courseType': selectedCourseType,
      'feeAmount': feeAmount,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Fee Structure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownField('Standard *', (value) {
              setState(() {
                selectedStandard = value!;
              });
            }, selectedStandard),
            SizedBox(height: 16),
            _buildDropdownField('Course Type *', (value) {
              setState(() {
                selectedCourseType = value!;
              });
            }, selectedCourseType),
            SizedBox(height: 16),
            _buildTextField('Fee Amount *', (value) {
              setState(() {
                feeAmount = value;
              });
            }, feeAmount),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, Function(String?) onChanged, String currentValue) {
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
              value: 'Standard 1',
              child: Text('Standard 1'),
            ),
            DropdownMenuItem(
              value: 'Standard 2',
              child: Text('Standard 2'),
            ),
          ],
          onChanged: onChanged,
          value: currentValue,
        ),
      ],
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged, String currentValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          initialValue: currentValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class FeeCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fee Collection Screen'));
  }
}
