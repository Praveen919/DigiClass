import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  final String option;

  SetupScreen({this.option = 'addYear'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (option) {
      case 'addYear':
        return AddYearScreen();
      case 'manageYear':
        return ManageYearScreen();
      case 'assignStandard':
        return AssignStandardScreen();
      case 'assignSubject':
        return AssignSubjectScreen();
      case 'addClassBatch':
        return AddClassBatchScreen();
      case 'manageClassBatch':
        return ManageClassBatchScreen();
      case 'manageTimeTable':
        return ManageTimeTableScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

class AddYearScreen extends StatefulWidget {
  @override
  _AddYearScreenState createState() => _AddYearScreenState();
}

class _AddYearScreenState extends State<AddYearScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? fromDate ?? DateTime.now() : toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Year', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Year Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
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
                      fromDate != null ? "${fromDate!.toLocal()}".split(' ')[0] : 'Select date',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: () => _selectDate(context, false),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'To Date',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(
                      toDate != null ? "${toDate!.toLocal()}".split(' ')[0] : 'Select date',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Remarks',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle submit
              // You can access fromDate and toDate here
            },
            child: Text('Reset'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle submit
              // You can access fromDate and toDate here
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

// Implement other screens similarly
class ManageYearScreen extends StatefulWidget {
  @override
  _ManageYearScreenState createState() => _ManageYearScreenState();
}

class _ManageYearScreenState extends State<ManageYearScreen> {
  String selectedExport = 'Export to Excel';
  int displayRecords = 10;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Manage Year', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.red[100],
            child: Text(
              'No record found!',
              style: TextStyle(color: Colors.red[900]),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedExport,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedExport = newValue!;
                    });
                  },
                  items: <String>['Export to Excel', 'Export to PDF']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle export action
                },
                child: Text('Export Now'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('No Record Found!'),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Display Records:'),
              SizedBox(width: 10),
              DropdownButton<int>(
                value: displayRecords,
                onChanged: (int? newValue) {
                  setState(() {
                    displayRecords = newValue!;
                  });
                },
                items: <int>[10, 20, 50]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AssignStandardScreen extends StatefulWidget {
  @override
  _AssignStandardScreenState createState() => _AssignStandardScreenState();
}

class _AssignStandardScreenState extends State<AssignStandardScreen> {
  List<String> standards = [
    '5th Standard',
    '6th Standard',
    '7th Standard',
    '8th Standard',
    '9th Standard',
    '10th Standard',
    '11th Science',
    '11th Commerce',
    '11th Arts',
    '12th Science',
    '12th Commerce',
    '12th Arts'
  ];

  List<String> assignedStandards = ['Common'];
  Map<String, bool> standardSelections = {};
  bool hasOtherRequirements = false;

  @override
  void initState() {
    super.initState();
    for (var standard in standards) {
      standardSelections[standard] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assign Standard',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          _buildManageStandardSection(),
          SizedBox(height: 20),
          _buildAssignedStandardSection(),
          SizedBox(height: 20),
          _buildButtonsSection(),
          SizedBox(height: 20),
          _buildAdditionalRequirementsCheckbox(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle assignment logic here
            },
            child: Text('Save Assignment'),
          ),
        ],
      ),
    );
  }

  Widget _buildManageStandardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Manage Standard',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Search by Standard Name',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        _buildStandardCheckboxList(),
      ],
    );
  }

  Widget _buildStandardCheckboxList() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: standards.map((standard) {
          return CheckboxListTile(
            title: Text(standard),
            value: standardSelections[standard],
            onChanged: (bool? value) {
              setState(() {
                standardSelections[standard] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAssignedStandardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assigned Standard :',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _buildAssignedStandardList(),
      ],
    );
  }

  Widget _buildAssignedStandardList() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: assignedStandards.map((assignedStandard) {
          return CheckboxListTile(
            title: Text(assignedStandard),
            value: true,
            onChanged: null,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle "Assign Standard" logic here
          },
          child: Text('Assign Standard'),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle "Remove Standard" logic here
          },
          child: Text('Remove Standard'),
        ),
      ],
    );
  }

  Widget _buildAdditionalRequirementsCheckbox() {
    return CheckboxListTile(
      title: Text('Do you have any other Standard requirements?'),
      value: hasOtherRequirements,
      onChanged: (bool? value) {
        setState(() {
          hasOtherRequirements = value!;
        });
      },
    );
  }
}


class AssignSubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Assign Subject Screen'));
  }
}

class AddClassBatchScreen extends StatefulWidget {
  @override
  _AddClassBatchScreenState createState() => _AddClassBatchScreenState();
}

class _AddClassBatchScreenState extends State<AddClassBatchScreen> {
  final _formKey = GlobalKey<FormState>();
  String? classBatchName;
  int? strength;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  Future<void> _selectTime(BuildContext context, bool isFromTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isFromTime ? fromTime ?? TimeOfDay.now() : toTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFromTime) {
          fromTime = picked;
        } else {
          toTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Class/Batch',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Class/Batch Name *',
                hintText: 'e.g. Class Room A 1',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a class/batch name';
                }
                return null;
              },
              onSaved: (value) {
                classBatchName = value;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Strength *',
                hintText: 'e.g. 30',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the strength';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                strength = int.tryParse(value!);
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectTime(context, true),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'From Time *',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        fromTime != null ? fromTime!.format(context) : 'Select time',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectTime(context, false),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'To Time *',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        toTime != null ? toTime!.format(context) : 'Select time',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Handle save action
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: Text('SAVE'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        fromTime = null;
                        toTime = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
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
}

class ManageClassBatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Class/Batch Screen'));
  }
}

class ManageTimeTableScreen extends StatefulWidget {
  @override
  _ManageTimeTableScreenState createState() => _ManageTimeTableScreenState();
}

class _ManageTimeTableScreenState extends State<ManageTimeTableScreen> {
  final TextEditingController _standardController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();

  bool isEditable = false; // Controls whether the grid is editable or not

  // Sample timetable data (normally this would be fetched from a database)
  List<List<String?>> _timeTable = List.generate(5, (i) => List.filled(5, null));

  void _viewTimeTable() {
    setState(() {
      // Example: Fetch timetable based on standard and batch
      // This should be replaced with real data fetching logic
      _timeTable = [
        ['Math', 'Science', 'English', 'History', 'PE'],
        ['Physics', 'Chemistry', 'Biology', 'Geography', 'Art'],
        ['Math', 'Science', 'English', 'History', 'PE'],
        ['Physics', 'Chemistry', 'Biology', 'Geography', 'Art'],
        ['Math', 'Science', 'English', 'History', 'PE'],
      ];
      isEditable = false;
    });
  }

  void _resetTimeTable() {
    setState(() {
      isEditable = true;
    });
  }

  void _updateTimeTable() {
    setState(() {
      // Example: Save the updated timetable
      // This should be replaced with real data saving logic
      isEditable = false;
      // Save _timeTable to the database or backend
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Time Table'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Navigate to the home screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _standardController,
              decoration: InputDecoration(
                labelText: 'Enter Standard *',
                hintText: 'e.g. 9th',
              ),
            ),
            TextField(
              controller: _batchController,
              decoration: InputDecoration(
                labelText: 'Enter Batch *',
                hintText: 'e.g. Morning/Afternoon/Evening',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _viewTimeTable,
                  child: Text('View'),
                ),
                ElevatedButton(
                  onPressed: _resetTimeTable,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text('Reset'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Timetable:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 5 columns for Mon-Fri
                  childAspectRatio: 2,
                ),
                itemCount: 25, // 5 days * 5 time slots (can be adjusted)
                itemBuilder: (context, index) {
                  int day = index % 5; // Day (Mon-Fri)
                  int timeSlot = index ~/ 5; // Time slot index

                  return GestureDetector(
                    onTap: isEditable
                        ? () async {
                      String? newLecture = await _editLectureDialog(_timeTable[timeSlot][day]);
                      if (newLecture != null) {
                        setState(() {
                          _timeTable[timeSlot][day] = newLecture;
                        });
                      }
                    }
                        : null,
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: isEditable ? Colors.white : Colors.grey[300],
                      ),
                      child: Center(
                        child: Text(
                          _timeTable[timeSlot][day] ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: isEditable ? _updateTimeTable : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Update Time Table'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _editLectureDialog(String? currentLecture) async {
    String? newLecture = currentLecture;
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Lecture'),
          content: TextField(
            controller: TextEditingController(text: newLecture),
            onChanged: (value) {
              newLecture = value;
            },
            decoration: InputDecoration(hintText: 'Enter Lecture Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(newLecture);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
