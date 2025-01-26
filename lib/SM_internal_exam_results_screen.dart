import 'package:flutter/material.dart';

class InternalExamResultsScreen extends StatefulWidget {
  @override
  _InternalExamResultsScreenState createState() => _InternalExamResultsScreenState();
}

class _InternalExamResultsScreenState extends State<InternalExamResultsScreen> {
  final _examNameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _marksController = TextEditingController();
  List<Map<String, String>> internalExamResults = [];

  void _addInternalExamResult() {
    setState(() {
      internalExamResults.add({
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
        .showSnackBar(SnackBar(content: Text('Internal Exam Result Added')));
  }

  void _deleteInternalExamResult(int index) {
    setState(() {
      internalExamResults.removeAt(index);
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Internal Exam Result Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internal Exam Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Internal Exam Results',
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
              onPressed: _addInternalExamResult,
              child: Text('Add Internal Exam Result'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: internalExamResults.length,
                itemBuilder: (context, index) {
                  final result = internalExamResults[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('${result['examName']} - ${result['marks']}'),
                      subtitle: Text('Student ID: ${result['studentId']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteInternalExamResult(index),
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
