import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final _subjectController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedClass = ''; // To store selected class for message
  String? _attachmentPath;

  // Sample classes - In a real app, this would come from a backend/database
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3'];

  // Sample messages list to simulate saved messages
  List<Map<String, dynamic>> previousMessages = [
    {
      'subject': 'Math Exam Notice',
      'content': 'The math exam will be held on 25th Jan.',
      'class': 'Class 1',
      'attachment': null,
    },
    {
      'subject': 'Holiday Announcement',
      'content': 'The school will be closed on 26th Jan.',
      'class': 'Class 2',
      'attachment': null,
    },
  ];

  // Function to handle sending message
  void _sendMessage() {
    final subject = _subjectController.text;
    final content = _contentController.text;

    if (subject.isEmpty || content.isEmpty || _selectedClass.isEmpty) {
      // Show an error if fields are empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill out all fields before sending the message.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Add the new message to the previous messages list
    setState(() {
      previousMessages.add({
        'subject': subject,
        'content': content,
        'class': _selectedClass,
        'attachment': _attachmentPath,
      });
    });

    // Clear the form and show a success message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Message sent successfully to $_selectedClass!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _clearForm();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Function to clear the form
  void _clearForm() {
    _subjectController.clear();
    _contentController.clear();
    setState(() {
      _selectedClass = '';
      _attachmentPath = null;
    });
  }

  // Function to pick a file (attachment)
  Future<void> _pickAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _attachmentPath = result.files.single.path;
      });
    }
  }

  // Function to update a message
  void _updateMessage(int index) {
    final message = previousMessages[index];

    // Pre-fill the form with the selected message data
    _subjectController.text = message['subject'];
    _contentController.text = message['content'];
    _selectedClass = message['class'];
    _attachmentPath = message['attachment'];

    // After updating the form, remove the old message and save the updated one
    setState(() {
      previousMessages[index] = {
        'subject': _subjectController.text,
        'content': _contentController.text,
        'class': _selectedClass,
        'attachment': _attachmentPath,
      };
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Message Updated')));
  }

  // Function to delete a message
  void _deleteMessage(int index) {
    setState(() {
      previousMessages.removeAt(index);
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Message Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Messages/Notices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Notices or Messages to Students',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Subject field
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            SizedBox(height: 10),
            // Message Content field
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Message Content'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            // Class selection dropdown
            DropdownButtonFormField<String>(
              value: _selectedClass.isEmpty ? null : _selectedClass,
              onChanged: (newClass) {
                setState(() {
                  _selectedClass = newClass!;
                });
              },
              decoration: InputDecoration(labelText: 'Select Class'),
              items: classes
                  .map((className) => DropdownMenuItem<String>(
                        value: className,
                        child: Text(className),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            // Attach File button
            ElevatedButton(
              onPressed: _pickAttachment,
              child: Text('Attach File'),
            ),
            SizedBox(height: 10),
            // Display the selected file (if any)
            if (_attachmentPath != null)
              Text('Attached: ${_attachmentPath?.split('/').last}'),
            SizedBox(height: 20),
            // Send Message button
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send Message'),
            ),
            SizedBox(height: 40),
            // Display previous messages with options to update or delete
            Text(
              'Previous Messages',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: previousMessages.length,
                itemBuilder: (context, index) {
                  final message = previousMessages[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(message['subject']),
                      subtitle: Text('Class: ${message['class']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _updateMessage(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteMessage(index);
                            },
                          ),
                        ],
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
