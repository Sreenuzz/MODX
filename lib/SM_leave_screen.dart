import 'package:flutter/material.dart';

class LeaveScreen extends StatefulWidget {
  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  // Sample leave application data with status and additional content
  List<Map<String, dynamic>> leaveApplications = [
    {
      'id': 1,
      'studentId': 101,
      'status': 'pending',
      'reason': 'Personal reasons',
      'startDate': '2025-01-30',
      'endDate': '2025-02-02'
    },
    {
      'id': 2,
      'studentId': 102,
      'status': 'pending',
      'reason': 'Family emergency',
      'startDate': '2025-02-05',
      'endDate': '2025-02-07'
    },
    {
      'id': 3,
      'studentId': 103,
      'status': 'pending',
      'reason': 'Medical leave',
      'startDate': '2025-02-10',
      'endDate': '2025-02-12'
    },
    {
      'id': 4,
      'studentId': 104,
      'status': 'pending',
      'reason': 'Vacation',
      'startDate': '2025-02-15',
      'endDate': '2025-02-20'
    },
    {
      'id': 5,
      'studentId': 105,
      'status': 'pending',
      'reason': 'Urgent personal work',
      'startDate': '2025-02-22',
      'endDate': '2025-02-23'
    },
  ];

  // Function to handle approval of leave
  void approveLeave(int id) {
    setState(() {
      leaveApplications = leaveApplications.map((application) {
        if (application['id'] == id) {
          application['status'] = 'approved';
        }
        return application;
      }).toList();
    });
  }

  // Function to handle rejection of leave
  void rejectLeave(int id) {
    setState(() {
      leaveApplications = leaveApplications.map((application) {
        if (application['id'] == id) {
          application['status'] = 'rejected';
        }
        return application;
      }).toList();
    });
  }

  // Function to verify/re-approve a rejected leave application
  void verifyLeave(int id) {
    setState(() {
      leaveApplications = leaveApplications.map((application) {
        if (application['id'] == id && application['status'] == 'rejected') {
          application['status'] = 'pending'; // Reset to pending for verification
        }
        return application;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Applications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View and Manage Leave Applications',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // ListView to display leave applications
            Expanded(
              child: ListView.builder(
                itemCount: leaveApplications.length,
                itemBuilder: (context, index) {
                  var leave = leaveApplications[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('Leave Application #${leave['id']}'),
                      subtitle: Text('Student ID #${leave['studentId']}'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        _showLeaveDetailsDialog(context, leave);
                      },
                      leading: _getStatusIndicator(leave['status']),
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

  // Widget to display leave status
  Widget _getStatusIndicator(String status) {
    switch (status) {
      case 'approved':
        return Icon(Icons.check_circle, color: Colors.green);
      case 'rejected':
        return Icon(Icons.cancel, color: Colors.red);
      case 'pending':
      default:
        return Icon(Icons.hourglass_empty, color: Colors.orange);
    }
  }

  // Show the dialog for approving or rejecting the leave application
  void _showLeaveDetailsDialog(BuildContext context, Map<String, dynamic> leave) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Leave Application #${leave['id']}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Reason: ${leave['reason']}'),
              SizedBox(height: 8),
              Text('Start Date: ${leave['startDate']}'),
              SizedBox(height: 8),
              Text('End Date: ${leave['endDate']}'),
              SizedBox(height: 8),
              Text('Status: ${leave['status']}'),
            ],
          ),
          actions: <Widget>[
            if (leave['status'] == 'pending') ...[
              TextButton(
                onPressed: () {
                  approveLeave(leave['id']);
                  Navigator.pop(context);
                },
                child: Text('Approve'),
              ),
              TextButton(
                onPressed: () {
                  rejectLeave(leave['id']);
                  Navigator.pop(context);
                },
                child: Text('Reject'),
              ),
            ] else if (leave['status'] == 'rejected') ...[
              TextButton(
                onPressed: () {
                  verifyLeave(leave['id']);
                  Navigator.pop(context);
                },
                child: Text('Verify Again'),
              ),
            ],
          ],
        );
      },
    );
  }
}
