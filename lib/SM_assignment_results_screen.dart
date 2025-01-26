import 'package:flutter/material.dart';

class AssignmentResultsScreen extends StatefulWidget {
  @override
  _AssignmentResultsScreenState createState() => _AssignmentResultsScreenState();
}

class _AssignmentResultsScreenState extends State<AssignmentResultsScreen> {
  final _assignmentNameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _marksController = TextEditingController();
  List<Map<String, String>> assignmentResults = [];

  void _addAssignmentResult() {
    setState(() {
      assignmentResults.add({
        'assignmentName': _assignmentNameController.text,
        'studentId': _studentIdController.text,
        'marks': _marksController.text,
      });
    });

    // Clear fields after adding
    _assignmentNameController.clear();
    _studentIdController.clear();
    _marksController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Assignment Result Added')));
  }

  void _deleteAssignmentResult(int index) {
    setState(() {
      assignmentResults.removeAt(index);
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Assignment Result Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Assignment Results',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _assignmentNameController,
              decoration: InputDecoration(labelText: 'Assignment Name'),
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
              onPressed: _addAssignmentResult,
              child: Text('Add Assignment Result'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: assignmentResults.length,
                itemBuilder: (context, index) {
                  final result = assignmentResults[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('${result['assignmentName']} - ${result['marks']}'),
                      subtitle: Text('Student ID: ${result['studentId']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteAssignmentResult(index),
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
