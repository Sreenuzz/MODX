import 'package:flutter/material.dart';
import 'Student Profile Verification.dart';
import 'Student Profile Verification.dart'; // Import your verification page

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({Key? key}) : super(key: key);

  @override
  State<StudentRegistrationPage> createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _admissionNoController = TextEditingController();
  String? _selectedGender;
  String? _selectedCourse;

  final List<String> _courses = ['B.Tech', 'B.Sc', 'B.Com', 'MBA', 'MCA'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Prepare the registration details
      final studentDetails = {
        'StudentName': _nameController.text,
        'Email': _emailController.text,
        'Phone_number': _phoneController.text,
        'Admission_no': _admissionNoController.text,
        'Gender': _selectedGender ?? 'N/A',
        'Course': _selectedCourse ?? 'N/A',
        'ClassName': 'N/A', // Add placeholders for missing details
        'Department': 'N/A',
        'Semester': 'N/A',
        'BatchYear': 'N/A',
        'Date_of_birth': 'N/A',
        'Blood_group': 'N/A',
        'Guardian_name': 'N/A',
        'Guardian_relation': 'N/A',
        'Guardian_phone': 'N/A',
        'Address': 'N/A',
        'images': 'assets/default_profile.png', // Replace with a valid asset path
      };

      // Navigate to the StudentProfileVerificationPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentProfileVerificationPage(
            profile: studentDetails,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Phone Field
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Admission Number Field
                TextFormField(
                  controller: _admissionNoController,
                  decoration: const InputDecoration(
                    labelText: 'Admission Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your admission number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Gender Dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Course Dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Course',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCourse,
                  items: _courses
                      .map((course) => DropdownMenuItem(
                            value: course,
                            child: Text(course),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCourse = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your course';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
