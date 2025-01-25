import 'package:flutter/material.dart';
import 'package:modx/StudentProfileVerificationPage.dart';
import 'package:modx/registration.dart';

class StudentProfileVerificationPage extends StatefulWidget {
  final Map<String, String> profile;

  const StudentProfileVerificationPage({Key? key, required this.profile}) : super(key: key);


  @override
  State<StudentProfileVerificationPage> createState() =>
      _StudentProfileVerificationPageState();
}

class _StudentProfileVerificationPageState
    extends State<StudentProfileVerificationPage> {
  String feedback = '';

  void _verifyProfile(String status) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile $status successfully!')),
    );
    Navigator.pop(context); // Go back to the previous page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile Verification'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(widget.profile['images']!),
                ),
              ),
              const SizedBox(height: 16.0),

              // Name
              Center(
                child: Text(
                  widget.profile['StudentName'] ?? 'No Name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Details Section
              const Text(
                'Profile Details:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),

              // Display each field
              ...[
                'ClassName',
                'StudentName',
                'Admission_no',
                'Department',
                'Semester',
                'BatchYear',
                'Gender',
                'Date_of_birth',
                'Blood_group',
                'Guardian_name',
                'Guardian_relation',
                'Guardian_phone',
                'Course',
                'Email',
                'Address',
                'Phone_number',
              ].map((key) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${key.replaceAll('_', ' ')}: ${widget.profile[key] ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),

              const SizedBox(height: 16.0),

              // Feedback Section
              const Text(
                'Feedback:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) => feedback = value,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Feedback (Optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Approve/Reject Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _verifyProfile('Approved'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Approve'),
                  ),
                  ElevatedButton(
                    onPressed: () => _verifyProfile('Rejected'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Reject'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
