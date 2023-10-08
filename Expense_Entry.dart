// expense_entry.dart

import 'package:flutter/material.dart';

class ExpenseEntryPage extends StatefulWidget {
  @override
  _ExpenseEntryPageState createState() => _ExpenseEntryPageState();
}

class _ExpenseEntryPageState extends State<ExpenseEntryPage> {
  final List<Expense> _expenses = []; // List to store entered expenses
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate;

  void _addExpense() {
    final enteredAmount = double.parse(_amountController.text);
    final enteredDescription = _descriptionController.text;
    final newExpense = Expense(
      amount: enteredAmount,
      description: enteredDescription,
      date: _selectedDate,
    );

    setState(() {
      _expenses.add(newExpense);
    });

    _amountController.clear();
    _descriptionController.clear();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10.0),
            Text(
              _selectedDate == null
                  ? 'Select a Date'
                  : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}',
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            ElevatedButton(
              onPressed: _addExpense,
              child: Text('Add Expense'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Entered Expenses',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('\$${_expenses[index].amount.toStringAsFixed(2)}'),
                      ),
                      title: Text(_expenses[index].description),
                      subtitle: Text(DateFormat.yMd().format(_expenses[index].date)),
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

class Expense {
  final double amount;
  final String description;
  final DateTime date;

  Expense({required this.amount, required this.description, required this.date});
}
