import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class StaffUserScreen extends StatefulWidget {
  final String option;

  StaffUserScreen({this.option = 'createStaff'});

  @override
  _StaffUserScreenState createState() => _StaffUserScreenState();
}

class _StaffUserScreenState extends State<StaffUserScreen> {
  List<Map<String, dynamic>> staffList = [];

  void addStaff(Map<String, dynamic> staff) {
    setState(() {
      staffList.add(staff);
    });
  }

  void editStaff(int index, Map<String, dynamic> staff) {
    setState(() {
      staffList[index] = staff;
    });
  }

  void deleteStaff(int index) {
    setState(() {
      staffList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff/User'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.option) {
      case 'createStaff':
        return CreateStaffScreen(onSave: addStaff);
      case 'manageStaff':
        return ManageStaffScreen(
          staffList: staffList,
          onEdit: editStaff,
          onDelete: deleteStaff,
        );
      case 'manageStaffRights':
        return ManageStaffRightsScreen(staffList: staffList); // Pass the staff list here
      case 'staffAttendance':
        return StaffAttendanceScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

class CreateStaffScreen extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSave;

  CreateStaffScreen({required this.onSave});

  @override
  _CreateStaffScreenState createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  XFile? _profilePicture;
  bool _isEditable = true;

  void _resetForm() {
    setState(() {
      _isEditable = true;
      _firstNameController.clear();
      _middleNameController.clear();
      _lastNameController.clear();
      _genderController.clear();
      _mobileController.clear();
      _emailController.clear();
      _addressController.clear();
      _profilePicture = null;
    });
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSave({
        'firstName': _firstNameController.text,
        'middleName': _middleNameController.text,
        'lastName': _lastNameController.text,
        'gender': _genderController.text,
        'mobile': _mobileController.text,
        'email': _emailController.text,
        'address': _addressController.text,
        'profilePicture': _profilePicture?.path, // Optionally save the image path
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Staff details saved successfully'),
      ));

      _resetForm();
    }
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool readOnly = false}) {
    return TextFormField(
      controller: controller,
      readOnly: !_isEditable || readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  Widget _buildProfilePicturePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Profile Picture:'),
        SizedBox(height: 10),
        GestureDetector(
          onTap: _isEditable ? _pickImage : null,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: _profilePicture == null
                ? Center(child: Text('No image selected'))
                : Image.file(File(_profilePicture!.path), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }

  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profilePicture = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Create New Staff',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildTextField('First Name*', _firstNameController),
              SizedBox(height: 16),
              _buildTextField('Middle Name*', _middleNameController),
              SizedBox(height: 16),
              _buildTextField('Last Name*', _lastNameController),
              SizedBox(height: 16),
              _buildTextField('Gender*', _genderController),
              SizedBox(height: 16),
              _buildTextField('Mobile No*', _mobileController),
              SizedBox(height: 16),
              _buildTextField('Email', _emailController),
              SizedBox(height: 16),
              _buildTextField('Address', _addressController),
              SizedBox(height: 20),
              _buildProfilePicturePicker(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManageStaffScreen extends StatelessWidget {
  final List<Map<String, dynamic>> staffList;
  final Function(int, Map<String, dynamic>) onEdit;
  final Function(int) onDelete;

  ManageStaffScreen(
      {required this.staffList, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    if (staffList.isEmpty) {
      return Center(
        child: Text('No staff available.'),
      );
    }

    return ListView.builder(
      itemCount: staffList.length,
      itemBuilder: (context, index) {
        final staff = staffList[index];
        return ListTile(
          leading: staff['profilePicture'] != null
              ? CircleAvatar(
            backgroundImage: FileImage(File(staff['profilePicture'])),
          )
              : CircleAvatar(child: Icon(Icons.person)),
          title: Text('${staff['firstName']} ${staff['lastName']}'),
          subtitle: Text(staff['mobile'] ?? ''),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _navigateToEditScreen(context, index, staff);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onDelete(index),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToEditScreen(BuildContext context, int index, Map<String, dynamic> staff) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateStaffScreen(
          onSave: (updatedStaff) {
            onEdit(index, updatedStaff);
            Navigator.pop(context); // Return to the previous screen after saving
          },
        ),
      ),
    );
  }
}

class ManageStaffRightsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> staffList;

  ManageStaffRightsScreen({required this.staffList});

  @override
  _ManageStaffRightsScreenState createState() => _ManageStaffRightsScreenState();
}

class _ManageStaffRightsScreenState extends State<ManageStaffRightsScreen> {
  String? _selectedStaff;
  String? _selectedRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assign Staff Action Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Staff Name*',
                border: OutlineInputBorder(),
              ),
              value: _selectedStaff,
              items: widget.staffList.map((staff) {
                return DropdownMenuItem<String>(
                  value: '${staff['firstName']} ${staff['middleName']} ${staff['lastName']}',
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                        '${staff['firstName']} ${staff['middleName']} ${staff['lastName']}'),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStaff = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a staff member';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Grant Rights:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildRightsRadioButton('Grant Admin Rights'),
            _buildRightsRadioButton('Grant Teacher Rights'),
            _buildRightsRadioButton('Grant Student Rights'),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _grantRights,
                child: Text('Grant Rights'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightsRadioButton(String title) {
    return RadioListTile<String>(
      title: Text(title),
      value: title,
      groupValue: _selectedRight,
      onChanged: (value) {
        setState(() {
          _selectedRight = value;
        });
      },
    );
  }

  void _grantRights() {
    if (_selectedStaff != null && _selectedRight != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$_selectedRight granted to $_selectedStaff'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select both staff and rights'),
      ));
    }
  }
}

class StaffAttendanceScreen extends StatefulWidget {
  @override
  _ManageStaffAttendanceScreenState createState() => _ManageStaffAttendanceScreenState();
}

class _ManageStaffAttendanceScreenState extends State<StaffAttendanceScreen> {
  DateTime? selectedDate;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Take Staff Attendance',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Attendance Date: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        selectedDate != null
                            ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                            : 'Select Date',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Implement your 'Take Attendance' functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                ),
                child: Text(
                  'Take Attendance',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
