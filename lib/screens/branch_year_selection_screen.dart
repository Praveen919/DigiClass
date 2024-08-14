import 'package:flutter/material.dart';
import 'package:testing_app/screens/admin/dashboard_screen.dart';
// Import your DashboardScreen here

class BranchYearSelectionScreen extends StatefulWidget {
  const BranchYearSelectionScreen({super.key});

  @override
  _BranchYearSelectionScreenState createState() => _BranchYearSelectionScreenState();
}

class _BranchYearSelectionScreenState extends State<BranchYearSelectionScreen> {
  String? selectedBranch;
  String? selectedYear;
  final List<String> branches = ['Branch 1', 'Branch 2', 'Branch 3'];
  final List<String> years = ['2022-2023', '2023-2024', '2024-2025'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch-Year Selection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Branch-Year Selection',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Branch *',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedBranch,
                      items: branches.map((branch) {
                        return DropdownMenuItem<String>(
                          value: branch,
                          child: Text(branch),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedBranch = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Year *',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedYear,
                      items: years.map((year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedBranch != null && selectedYear != null) {
                          print('Selected Branch: $selectedBranch, Year: $selectedYear');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(),
                            ),
                          );
                        } else {
                          print('Please select both branch and year');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
