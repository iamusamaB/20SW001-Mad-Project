// main.dart

import 'package:flutter/material.dart';
import 'expense_entry.dart'; // Import the expense entry page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Splitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Splitter'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/money.png', 
              width: 150.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to Expense Splitter',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Easily split expenses with your friends!',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the expense entry page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExpenseEntryPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                textStyle: TextStyle(fontSize: 18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
