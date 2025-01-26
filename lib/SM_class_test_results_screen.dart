import 'package:flutter/material.dart';

class ClassTestResultsScreen extends StatefulWidget {
  @override
  _ClassTestResultsScreenState createState() => _ClassTestResultsScreenState();
}

class _ClassTestResultsScreenState extends State<ClassTestResultsScreen> {
  final _examNameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _marksController = TextEditingController();
  List<Map<String, String>> classTestResults = [];

  void _addClassTestResult() {
    setState(() {
      classTestResults.add({
        'examName': _examNameController.text,
        'studentId': _studentIdController.text,
        'marks': _marksController.text,
      });
    });

    // Clear fields after adding
    _examNameController.clear();
    _studentIdController.clear();
    _marksController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Class Test Result Added')));
  }

  void _deleteClassTestResult(int index) {
    setState(() {
      classTestResults.removeAt(index);
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Class Test Result Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Test Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Class Test Results',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _examNameController,
              decoration: InputDecoration(labelText: 'Exam Name'),
            ),
            TextFormField(
              controller: _studentIdController,
              decoration: InputDecoration(labelText: 'Student ID'),
            ),
            TextFormField(
              controller: _marksController,
              decoration: InputDecoration(labelText: 'Marks'),
            ),
            ElevatedButton(
              onPressed: _addClassTestResult,
              child: Text('Add Class Test Result'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: classTestResults.length,
                itemBuilder: (context, index) {
                  final result = classTestResults[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('${result['examName']} - ${result['marks']}'),
                      subtitle: Text('Student ID: ${result['studentId']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteClassTestResult(index),
                      ),
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
