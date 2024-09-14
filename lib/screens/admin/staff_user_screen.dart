import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class StaffUserScreen extends StatefulWidget {
  final String option;

  const StaffUserScreen({super.key, this.option = 'createStaff'});

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
        title: const Text('Staff/User'),
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
        return const StaffAttendanceScreen();
      default:
        return const Center(child: Text('Unknown Option'));
    }
  }
}

class CreateStaffScreen extends StatefulWidget {
  final Map<String, dynamic>? staff; // Optional parameter for editing staff
  final void Function(Map<String, dynamic>) onSave;

  const CreateStaffScreen({Key? key, this.staff, required this.onSave}) : super(key: key);

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
  final _passwordController = TextEditingController(); // Password controller
  XFile? _profilePicture;
  bool _isEditable = true;

  @override
  void initState() {
    super.initState();
    if (widget.staff != null) {
      // Initialize controllers with staff data if available
      final staff = widget.staff!;
      _firstNameController.text = staff['firstName'] ?? '';
      _middleNameController.text = staff['middleName'] ?? '';
      _lastNameController.text = staff['lastName'] ?? '';
      _genderController.text = staff['gender'] ?? '';
      _mobileController.text = staff['mobile'] ?? '';
      _emailController.text = staff['email'] ?? '';
      _addressController.text = staff['address'] ?? '';
      _profilePicture = staff['profilePicture'] != null ? XFile(staff['profilePicture']) : null;
      _isEditable = false; // Set editable state based on staff data
    }
  }

  void _resetForm() {
    if (widget.staff == null) {
      setState(() {
        _isEditable = true;
        _firstNameController.clear();
        _middleNameController.clear();
        _lastNameController.clear();
        _genderController.clear();
        _mobileController.clear();
        _emailController.clear();
        _addressController.clear();
        _passwordController.clear(); // Clear password field
        _profilePicture = null;
      });
    }
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final staffData = {
        'firstName': _firstNameController.text,
        'middleName': _middleNameController.text,
        'lastName': _lastNameController.text,
        'gender': _genderController.text,
        'mobile': _mobileController.text,
        'email': _emailController.text,
        'address': _addressController.text,
        'profilePicture': _profilePicture?.path, // Save image path
      };

      final staffUrl = widget.staff == null
          ? 'http://192.168.0.102:3000/api/staff' // URL for creating staff
          : 'http://192.168.0.102:3000/api/staff/${widget.staff!['id']}'; // URL for updating staff

      final method = widget.staff == null ? 'POST' : 'PUT';

      // Save to staff collection
      final staffResponse = await http.post(
        Uri.parse(staffUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(staffData),
      );

      // Save to users collection for login
      if (widget.staff == null) {
        final usersData = {
          'email': _emailController.text,
          'password': _passwordController.text,
          'role': 'staff',  // Define role as staff
        };

        final usersUrl = 'http://192.168.0.102:3000/api/users/create'; // URL for creating users

        final usersResponse = await http.post(
          Uri.parse(usersUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(usersData),
        );

        if (staffResponse.statusCode == 201 && usersResponse.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Staff details saved successfully')),
          );
          widget.onSave(staffData); // Notify parent widget with saved data
          _resetForm();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save staff details')),
          );
        }
      } else {
        if (staffResponse.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Staff details updated successfully')),
          );
          widget.onSave(staffData); // Notify parent widget with saved data
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update staff details')),
          );
        }
      }
    }
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool readOnly = false}) {
    return TextFormField(
      controller: controller,
      readOnly: !_isEditable || readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    if (widget.staff != null) return Container(); // Don't show password field for existing staff
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );
  }

  Widget _buildProfilePicturePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Profile Picture:'),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _isEditable ? _pickImage : null,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: _profilePicture == null
                ? const Center(child: Text('No image selected'))
                : Image.file(File(_profilePicture!.path), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

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
              _buildTextField('First Name*', _firstNameController),
              const SizedBox(height: 16),
              _buildTextField('Middle Name*', _middleNameController),
              const SizedBox(height: 16),
              _buildTextField('Last Name*', _lastNameController),
              const SizedBox(height: 16),
              _buildTextField('Gender*', _genderController),
              const SizedBox(height: 16),
              _buildTextField('Mobile No*', _mobileController),
              const SizedBox(height: 16),
              _buildTextField('Email', _emailController),
              const SizedBox(height: 16),
              _buildTextField('Address', _addressController),
              const SizedBox(height: 16),
              _buildPasswordField(), // Include password field for new staff
              const SizedBox(height: 20),
              _buildProfilePicturePicker(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text(widget.staff == null ? 'Create Staff' : 'Update Staff'),
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

  const ManageStaffScreen({
    super.key,
    required this.staffList,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          final staff = staffList[index];
          return ListTile(
            leading: staff['profilePicture'] != null
                ? CircleAvatar(
              backgroundImage: staff['profilePicture'].startsWith('http')
                  ? NetworkImage(staff['profilePicture']) as ImageProvider
                  : FileImage(File(staff['profilePicture'])),
            )
                : const CircleAvatar(child: Icon(Icons.person)),
            title: Text('${staff['firstName']} ${staff['lastName']}'),
            subtitle: Text(staff['email'] ?? 'No email'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => onEdit(index, staff),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onDelete(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ManageStaffRightsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> staffList;

  const ManageStaffRightsScreen({Key? key, required this.staffList}) : super(key: key);

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
                  value: '${staff['id']}', // Use ID for unique identification
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
      // Extract the staff ID from the selected staff
      final selectedStaffId = widget.staffList.firstWhere(
              (staff) => '${staff['id']}' == _selectedStaff,
          orElse: () => {}
      )['id'];

      if (selectedStaffId != null) {
        // Here you can add the logic to save the granted rights to the backend/database
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$_selectedRight granted to ${widget.staffList.firstWhere((staff) => '${staff['id']}' == _selectedStaff)['firstName']}'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error granting rights. Staff not found.'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select both staff and rights'),
      ));
    }
  }
}

class StaffAttendanceScreen extends StatefulWidget {
  const StaffAttendanceScreen({super.key});

  @override
  _ManageStaffAttendanceScreenState createState() => _ManageStaffAttendanceScreenState();
}

class _ManageStaffAttendanceScreenState extends State<StaffAttendanceScreen> {
  DateTime? selectedDate;
  DateTime? fromDate;
  DateTime? toDate;
  bool _attendanceTaken = false;
  bool _isEditable = false;

  // Dummy attendance data (to simulate actual attendance records)
  List<Map<String, String>> attendanceData = [
    {'srNo': '1', 'staffName': 'Staff 1', 'attendance': 'Present'},
    {'srNo': '2', 'staffName': 'Staff 2', 'attendance': 'Absent'},
    {'srNo': '3', 'staffName': 'Staff 3', 'attendance': 'Present'},
  ];

  // Select the main attendance date
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _attendanceTaken
              ? _buildAttendanceTable()
              : _buildAttendanceForm(),
        ),
      ),
    );
  }

  // Attendance form with date selection
  Widget _buildAttendanceForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Take Staff Attendance',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Attendance Date: ',
              style: TextStyle(fontSize: 18),
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  selectedDate != null
                      ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                      : 'Select Date',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _attendanceTaken = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          ),
          child: const Text(
            'Take Attendance',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

// Attendance table grid after clicking "Take Attendance"
  Widget _buildAttendanceTable() {
    return Column(
      children: [
        const SizedBox(height: 20),
        if (selectedDate != null)
          Text(
            'Attendance Date: ${DateFormat('dd/MM/yyyy').format(
                selectedDate!)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Sr. No.')),
                DataColumn(label: Text('Staff Name')),
                DataColumn(label: Text('Attendance')),
              ],
              rows: attendanceData.map((data) {
                return DataRow(cells: [
                  DataCell(Text(data['srNo']!)),
                  DataCell(Text(data['staffName']!)),
                  DataCell(
                    _isEditable
                        ? DropdownButton<String>(
                      value: data['attendance'],
                      items: ['Present', 'Absent'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          data['attendance'] = newValue!;
                        });
                      },
                    )
                        : Text(data['attendance']!),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _isEditable = !_isEditable;
                  });
                },
                icon: Icon(_isEditable ? Icons.lock : Icons.edit),
                label: Text(_isEditable ? 'Stop Edit' : 'Edit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 0),
                ),
              ),
            ),
    const SizedBox(width: 20),
    ElevatedButton(
    onPressed: () {
    // Implement your 'Update Attendance' functionality here
    setState(() {
    _isEditable = false;
    });
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
    child: const Text(
    'Update Attendance',
    style: TextStyle(fontSize: 18, color: Colors.white),
    ),
    ),

          ],
        ),
      ],
    );
  }
}
