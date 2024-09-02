import 'package:flutter/material.dart';

class Expense {
  final String name;
  final String paymentMode;
  final String chequeNo;
  final String date;
  final double amount;
  final String remark;

  Expense({
    required this.name,
    required this.paymentMode,
    required this.chequeNo,
    required this.date,
    required this.amount,
    required this.remark,
  });
}

class ExpensesIncomeScreen extends StatefulWidget {
  final String option;

  ExpensesIncomeScreen({this.option = 'addExpense'});

  @override
  _ExpensesIncomeScreenState createState() => _ExpensesIncomeScreenState();
}

class _ExpensesIncomeScreenState extends State<ExpensesIncomeScreen> {
  List<Expense> expenses = [];

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void updateExpense(int index, Expense updatedExpense) {
    setState(() {
      expenses[index] = updatedExpense;
    });
  }

  void deleteExpense(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses & Income'),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.option) {
      case 'addExpense':
        return AddExpenseScreen(onAddExpense: addExpense);
      case 'manageExpense':
        return ManageExpenseScreen(expenses: expenses, onDeleteExpense: deleteExpense, onUpdateExpense: updateExpense);
      case 'addExpenseType':
        return AddExpenseTypeScreen();
      case 'manageExpenseType':
        return ManageExpenseTypeScreen();
      case 'addIncome':
        return AddIncomeScreen();
      case 'manageIncome':
        return ManageIncomeScreen();
      default:
        return Center(child: Text('Unknown Option'));
    }
  }
}

class AddExpenseScreen extends StatefulWidget {
  final Function(Expense) onAddExpense;

  AddExpenseScreen({required this.onAddExpense});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String? expenseType;
  String? paymentMode;
  TextEditingController chequeNoController = TextEditingController();
  TextEditingController chequeInFavorOfController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  void _submitForm() {
    if (expenseType != null && paymentMode != null && amountController.text.isNotEmpty) {
      final newExpense = Expense(
        name: expenseType!,
        paymentMode: paymentMode!,
        chequeNo: chequeNoController.text,
        date: "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
        amount: double.parse(amountController.text),
        remark: remarkController.text,
      );
      widget.onAddExpense(newExpense);
      _resetForm();
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  void _resetForm() {
    setState(() {
      expenseType = null;
      paymentMode = null;
      chequeNoController.clear();
      chequeInFavorOfController.clear();
      selectedDate = DateTime.now();
      amountController.clear();
      remarkController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Daily Expense Setup',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Create New Daily Expense Setup',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Expense Type *',
              border: OutlineInputBorder(),
            ),
            value: expenseType,
            onChanged: (String? newValue) {
              setState(() {
                expenseType = newValue;
              });
            },
            items: <String>['-- Select --']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Payment Mode *',
              border: OutlineInputBorder(),
            ),
            value: paymentMode,
            onChanged: (String? newValue) {
              setState(() {
                paymentMode = newValue;
              });
            },
            items: <String>['-- Select --']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: chequeNoController,
            decoration: InputDecoration(
              labelText: 'Cheque No:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: chequeInFavorOfController,
            decoration: InputDecoration(
              labelText: 'Cheque in favour of:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    labelText: 'Month',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedDate.month,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedDate = DateTime(selectedDate.year, newValue, selectedDate.day);
                      });
                    }
                  },
                  items: List.generate(12, (index) => index + 1)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    labelText: 'Day',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedDate.day,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedDate = DateTime(selectedDate.year, selectedDate.month, newValue);
                      });
                    }
                  },
                  items: List.generate(31, (index) => index + 1)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    labelText: 'Year',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedDate.year,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedDate = DateTime(newValue, selectedDate.month, selectedDate.day);
                      });
                    }
                  },
                  items: List.generate(10, (index) => DateTime.now().year + index)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Amount *',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: remarkController,
            decoration: InputDecoration(
              labelText: 'Remark *',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _resetForm,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ManageExpenseScreen extends StatefulWidget {
  final List<Expense> expenses;
  final Function(int) onDeleteExpense;
  final Function(int, Expense) onUpdateExpense;

  ManageExpenseScreen({required this.expenses, required this.onDeleteExpense, required this.onUpdateExpense});

  @override
  _ManageExpenseScreenState createState() => _ManageExpenseScreenState();
}

class _ManageExpenseScreenState extends State<ManageExpenseScreen> {
  List<Expense> filteredExpenses = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredExpenses = widget.expenses;
  }

  void _filterExpenses(String query) {
    setState(() {
      filteredExpenses = widget.expenses.where((expense) {
        return expense.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _showEditDialog(BuildContext context, Expense expense, int index) {
    final TextEditingController nameController = TextEditingController(text: expense.name);
    final TextEditingController paymentModeController = TextEditingController(text: expense.paymentMode);
    final TextEditingController chequeNoController = TextEditingController(text: expense.chequeNo);
    final TextEditingController dateController = TextEditingController(text: expense.date);
    final TextEditingController amountController = TextEditingController(text: expense.amount.toString());
    final TextEditingController remarkController = TextEditingController(text: expense.remark);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Expense'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(nameController, 'Expense Name'),
              _buildTextField(paymentModeController, 'Payment Mode'),
              _buildTextField(chequeNoController, 'Cheque No'),
              _buildTextField(dateController, 'Date'),
              _buildTextField(amountController, 'Amount', keyboardType: TextInputType.number),
              _buildTextField(remarkController, 'Remark'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              widget.onUpdateExpense(
                index,
                Expense(
                  name: nameController.text,
                  paymentMode: paymentModeController.text,
                  chequeNo: chequeNoController.text,
                  date: dateController.text,
                  amount: double.tryParse(amountController.text) ?? 0.0,
                  remark: remarkController.text,
                ),
              );
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: _filterExpenses,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredExpenses.length,
            itemBuilder: (context, index) {
              final expense = filteredExpenses[index];
              return ListTile(
                title: Text(expense.name),
                subtitle: Text('${expense.date} - ${expense.amount}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showEditDialog(context, expense, index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        widget.onDeleteExpense(index);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AddExpenseTypeScreen extends StatelessWidget {
  final TextEditingController _expenseTypeController = TextEditingController();

  void _saveExpenseType() {
    // Add your save logic here
    String expenseType = _expenseTypeController.text;
    if (expenseType.isNotEmpty) {
      // Save expense type
      print("Expense Type Saved: $expenseType");
    } else {
      // Show validation error
      print("Expense Type cannot be empty");
    }
  }

  void _resetForm() {
    _expenseTypeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Create Expense Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            controller: _expenseTypeController,
            decoration: const InputDecoration(
              labelText: 'Expense Type*',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveExpenseType,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('SAVE'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _resetForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('RESET'),
          ),
        ],
      ),
    );
  }
}

// Placeholder for other screens

class ManageExpenseTypeScreen extends StatelessWidget {
  final List<String> expenseTypes = ["XXXXXX"]; // Dummy data for now

  void _editExpenseType(BuildContext context, int index) {
    // Implement edit logic
    print("Edit Expense Type: ${expenseTypes[index]}");
  }

  void _deleteExpenseType(int index) {
    // Implement delete logic
    print("Delete Expense Type: ${expenseTypes[index]}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expense Type Setup',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: expenseTypes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}."),
                  title: Text("Expense Type: ${expenseTypes[index]}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editExpenseType(context, index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteExpenseType(index),
                      ),
                    ],
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

class AddIncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create New Income Setup',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildTextField('Income Type *', 'e.g. 10th'),
                SizedBox(height: 10),
                _buildTextField('Payment Type *', 'e.g. Cash/Cheque/UPI'),
                SizedBox(height: 10),
                _buildTextField('Cheque No', ''),
                SizedBox(height: 10),
                _buildTextField('Bank Name', ''),
                SizedBox(height: 10),
                _buildTextField('Date *', 'e.g. 24th June 2024'),
                SizedBox(height: 10),
                _buildTextField('Amount *', ''),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Save action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text('SAVE'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Reset action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text('RESET'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}


class ManageIncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Income'),
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
                itemCount: 1, // Replace with actual income data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Income Type: X'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payment Type: XX'),
                        Text('Cheque No.: X'),
                        Text('Date: XX/XX/XX'),
                        Text('Amount: X'),
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
