import 'package:flutter/material.dart';
import 'package:modx/teacherhomepage.dart';
import 'package:modx/Student Profile Verification.dart';
import 'package:modx/registration.dart';

import 'Student Profile Verification.dart';
// import 'addteacherprofiledetail.dart'; // Ensure this path is correct
// import 'addstudentprofiledetail.dart'; // Ensure this path is correct


void main() {
  runApp(MaterialApp(
    home: RegistrationTabs(),
  ));
}

class RegistrationTabs extends StatelessWidget {
  const RegistrationTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Student and Teacher
      initialIndex: 0, // Set default to Student (0 = Student, 1 = Teacher)
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Registration"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Student"),
              Tab(text: "Teacher"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StudentRegistrationForm(),
            TeacherRegistrationForm(),
          ],
        ),
      ),
    );
  }
}


class StudentRegistrationForm extends StatelessWidget {
  const StudentRegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Student Registration",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Username Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Email Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Confirm Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student Registration Submitted")),
      );

      // Navigate to the Student Complete Profile screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TeacherHomePage(),
        ),
      );
    }
  },
  child: const Text("Register as Student"),
),

          ],
        ),
      ),
    );
  }
}

class TeacherRegistrationForm extends StatelessWidget {
  const TeacherRegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Teacher Registration",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Username Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Email Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Confirm Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {if (_formKey.currentState!.validate()) {
      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student Registration Submitted")),
      );

      // Navigate to the Student Complete Profile screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StudentProfileVerificationPage(profile: {},),
        ),
      );
    }
  },
              child: const Text("Register as Teacher"),
            ),
          ],
        ),
      ),
    );
  }
}
