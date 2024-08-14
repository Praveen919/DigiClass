import 'package:flutter/material.dart';
import 'dart:io'; // For File class
import 'package:image_picker/image_picker.dart'; // For picking images

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 0; // To track the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Row(
        children: <Widget>[
          // Side panel
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.lock),
                label: Text('Change Password'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Profile Settings'),
              ),
              // Add more destinations for other settings
              NavigationRailDestination(
                icon: Icon(Icons.chat_bubble_outline),
                label: Text('Auto Notification Settings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.circle_notifications_sharp),
                label: Text('Auto Whatsapp Settings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.content_paste),
                label: Text('My Plan'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_add_alt_1),
                label: Text('My Referral'),
              ),
            ],
          ),

          // Main content area
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: <Widget>[
                ChangePasswordScreen(),
                ProfileSettingsScreen(),
                AutoNotificationSettingScreen(),
                AutoWhatsappSettingScreen(),
                MyPlanScreen(),
                MyReferralScreen(),

                // Add more widgets for other settings
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Screen for Change Password
class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle change password logic
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }
}

// Screen for Profile Settings
class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  // Controllers for the input fields
  TextEditingController instituteNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController feeRecHeaderController = TextEditingController();
  TextEditingController branchAddressController = TextEditingController();
  TextEditingController taxNoController = TextEditingController();
  TextEditingController feeFooterController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // For dropdown selection
  String logoDisplay = 'Yes';
  String feeStatusDisplay = 'Yes';
  String chatOption = 'Yes';

  // For image selection
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _image = File(selectedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Coaching Class Detail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildTextField('Institute Name', instituteNameController),
            _buildTextField('Country', countryController),
            _buildTextField('City', cityController),
            _buildTextField('Branch Name', branchNameController),
            _buildTextField('Fee Rec. Header', feeRecHeaderController),
            _buildTextField('Branch Address', branchAddressController),
            _buildTextField('Tax No.', taxNoController),
            _buildTextField('Fee Footer', feeFooterController),
            SizedBox(height: 20),
            Text(
              'Profile Logo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!, height: 100, width: 100),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            _buildDropdown('Display logo on receipt?', logoDisplay, ['Yes', 'No'], (value) {
              setState(() {
                logoDisplay = value!;
              });
            }),
            _buildDropdown('Display fee status on receipt?', feeStatusDisplay, ['Yes', 'No'], (value) {
              setState(() {
                feeStatusDisplay = value!;
              });
            }),
            _buildDropdown('Allow students to chat?', chatOption, ['Yes', 'No'], (value) {
              setState(() {
                chatOption = value!;
              });
            }),
            SizedBox(height: 20),
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildTextField('Name', nameController),
            _buildTextField('Mobile No.', mobileController),
            _buildTextField('Email', emailController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a text field
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Helper method to build a dropdown
  Widget _buildDropdown(
      String label, String currentValue, List<String> options, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: currentValue,
            isExpanded: true,
            onChanged: onChanged,
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// Screen for Auto Notification Settings
class AutoNotificationSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Auto Notification Settings Screen'),
    );
  }
}

// Screen for Auto Whatsapp Settings
class AutoWhatsappSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Auto Whatsapp Settings Screen'),
    );
  }
}

// Screen for My Plan
class MyPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Plan Screen'),
    );
  }
}

// Screen for My Referral
class MyReferralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Referral Screen'),
    );
  }
}
