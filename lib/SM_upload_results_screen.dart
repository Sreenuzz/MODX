import 'package:flutter/material.dart';
import 'SM_class_test_results_screen.dart';
import 'SM_internal_exam_results_screen.dart';
import 'SM_assignment_results_screen.dart';

class UploadResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Exam Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Results for Various Exam Types',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassTestResultsScreen()),
                );
              },
              child: Text('Class Test Results'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InternalExamResultsScreen()),
                );
              },
              child: Text('Internal Exam Results'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssignmentResultsScreen()),
                );
              },
              child: Text('Assignment Results'),
            ),
            // Add more buttons for other result types
          ],
        ),
      ),
    );
  }
}
