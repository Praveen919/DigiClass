import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io'; // For File class
import 'package:image_picker/image_picker.dart'; // For picking images

class SettingsScreen extends StatelessWidget {
  final String option;

  SettingsScreen({required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (option) {
      case 'profileSetting':
        return ProfileSettings();
      case 'changePassword':
        return ChangePassword();
      case 'autoNotification':
        return AutoNotificationSettingsScreen();
      case 'autoWhatsApp':
        return AutoWhatsappSettingScreen();
      case 'myPlan':
        return MyPlanScreen();
      case 'myReferral':
        return MyReferralScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

// Screen for Profile Settings
class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettings> {
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
    return SingleChildScrollView(
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

// Screen for Change Password
class ChangePassword extends StatelessWidget {
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

class NoteSection extends StatelessWidget {
  final String noteText;

  NoteSection({required this.noteText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.yellow[100],
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.black54),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              noteText,
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

// Screen for Auto Notification Settings
class AutoNotificationSettingsScreen extends StatefulWidget {
  @override
  _AutoNotificationSettingsState createState() => _AutoNotificationSettingsState();
}

class _AutoNotificationSettingsState extends State<AutoNotificationSettingsScreen> {
  // Map to store the state of each checkbox
  final Map<String, bool> notificationSettings = {
    'Student Absent Attendance Notification': false,
    'Attendance Performance Status Notification': false,
    'Fee Reminder Notification': false,
    'New Manual Exam Scheduled Notification': false,
    'Student Absent in Exam': false,
    'Student Exam Marks Notification': false,
    'New MCQ Exam assigned Notification': false,
    'Student absent in MCQ Exam Notification': false,
    'Student MCQ Exam Marks Notification': false,
    'New Assignment shared Notification': false,
    'New Document Shared Notification': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            NoteSection(noteText: 'You can set auto Notifications to ON & the system will send Notifications accordingly to student or parents.'),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: notificationSettings.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: notificationSettings[key],
                    onChanged: (bool? value) {
                      setState(() {
                        notificationSettings[key] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen for Auto Whatsapp Settings
class AutoWhatsappSettingScreen extends StatefulWidget {
  @override
  _AutoWhatsappSettingScreenState createState() => _AutoWhatsappSettingScreenState();
}

class _AutoWhatsappSettingScreenState extends State<AutoWhatsappSettingScreen> {
  // Map to track checkbox states
  Map<String, bool> whatsappSettings = {
    "Inquiry Welcome Message to Student": false,
    "Welcome Message to Student": false,
    "Account ID/Password Message to Student": false,
    "Student Absent Attendance Notification": false,
    "Attendance Performance Status Notification": false,
    "Fee Reminder Notification": false,
    "New Manual Exam Scheduled Notification": false,
    "Student Absent in Exam": false,
    "Student Exam Marks Notification": false,
    "New MCQ Exam assigned Notification": false,
    "Student absent in MCQ Exam Notification": false,
    "Student MCQ Exam Marks Notification": false,
    "New Assignment shared Notification": false,
    "New Document Shared Notification": false,
    "New Study Material Shared Notification": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            NoteSection(noteText: 'You can set auto Notifications to ON & the system will send Notifications accordingly to student or parents.'),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: whatsappSettings.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: whatsappSettings[key],
                    onChanged: (bool? value) {
                      setState(() {
                        whatsappSettings[key] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen for My Plan
class MyPlanScreen extends StatefulWidget {
  @override
  _MyPlanScreenState createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  bool showPlan = true;
  String selectedExport = '--Select--';

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text('Plan'),
                  onPressed: () {
                    setState(() {
                      showPlan = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(

                    foregroundColor: Colors.black, backgroundColor: showPlan ? Colors.white : Colors.grey[300],
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text('Invoices'),
                  onPressed: () {
                    setState(() {
                      showPlan = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: !showPlan ? Colors.white : Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: showPlan ? _buildPlanContent() : _buildInvoicesContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanContent() {
    return Container(
      color: Colors.grey[600],
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Free Trial will be expired\n on 26 Jun 2024',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'To subscribe to our paid plan,\n you can contact sales/support\nteam at',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '+91 11111 22222 Or\n+91 3646457575',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoicesContent() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.red[100],
            child: Text(
              'No record found!',
              style: TextStyle(color: Colors.red[900]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedExport,
                  isExpanded: true,
                  items: ['--Select--', 'Option 1', 'Option 2'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedExport = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                child: Text('Export Now'),
                onPressed: () {
                  // Handle export
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'No record found!',
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text('Display records:'),
              SizedBox(width: 8),
              DropdownButton<int>(
                value: 10,
                items: [10, 20, 50].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  // Handle display records change
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Screen for My Referral
class MyReferralScreen extends StatelessWidget {
  final String referralLink = 'https://example.com/ref/ABC123DE-F4567-4A8B-1A2B4C';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'My Referral',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Track your rewards',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                // You can add content here if needed
              ),
              SizedBox(height: 16),
              Text(
                'Share your referral link with others and you will get 10% when they do payment on first time.',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Ask your friends to take subscription using your personalized referral link, you will rewarded with 10% commission on first payment.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Share your reference link and earn',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'https://example.com/ref/ABC123DE-F4567-4A8B-1A2B4C',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      child: Text('COPY'),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: referralLink)).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Referral link copied to clipboard')),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(double.infinity, 36),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
