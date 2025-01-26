import 'package:flutter/material.dart';

class ClassInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Class Information and Teacher Details',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Class: Example Class Name'),
            Text('Teacher: Example Teacher Name'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle class info updates or actions
              },
              child: Text('Edit Class Information'),
            ),
          ],
        ),
      ),
    );
  }
}
