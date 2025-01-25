import 'package:flutter/material.dart';

import 'SM_homepage.dart';

class StudentCompleteProfile extends StatelessWidget {
  const StudentCompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController studentNameController = TextEditingController();
    final TextEditingController admissionNoController = TextEditingController();
    final TextEditingController departmentController = TextEditingController();
    final TextEditingController batchYearController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController dobController = TextEditingController();
    final TextEditingController bloodGroupController = TextEditingController();
    final TextEditingController guardianNameController = TextEditingController();
    final TextEditingController guardianRelationController =
        TextEditingController();
    final TextEditingController guardianPhoneController = TextEditingController();
    final TextEditingController courseController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();

    // Dropdown lists for Class, Semester, Gender
    List<String> classList = [" bsc cs", "bcom ", "bcom ca","ba english", "ba malayalam", "msc cs", "msc math", "msc physics","mcom"]; 
    String? selectedClass;

    List<String> semesterList = ["Semester 1", "Semester 2", "Semester 3", "Semester 4", "Semester 5", "Semester 6", "Semester 7", "Semester 8"];
    String? selectedSemester;

    List<String> genderList = ["Male", "Female", "Other"];
    String? selectedGender;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Complete Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Student Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Class Dropdown
                DropdownButtonFormField<String>(
                  value: selectedClass,
                  decoration: const InputDecoration(labelText: 'Class'),
                  items: classList.map((cls) {
                    return DropdownMenuItem(
                      value: cls,
                      child: Text(cls),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedClass = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a class';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Student Name
                TextFormField(
                  controller: studentNameController,
                  decoration: const InputDecoration(
                    labelText: "Student Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Admission Number
                TextFormField(
                  controller: admissionNoController,
                  decoration: const InputDecoration(
                    labelText: "Admission Number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the admission number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Department
                TextFormField(
                  controller: departmentController,
                  decoration: const InputDecoration(
                    labelText: "Department",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the department';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Semester Dropdown
                DropdownButtonFormField<String>(
                  value: selectedSemester,
                  decoration: const InputDecoration(labelText: 'Semester'),
                  items: semesterList.map((semester) {
                    return DropdownMenuItem(
                      value: semester,
                      child: Text(semester),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedSemester = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a semester';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Batch Year
                TextFormField(
                  controller: batchYearController,
                  decoration: const InputDecoration(
                    labelText: "Batch Year",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the batch year';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Age
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Gender Dropdown
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: const InputDecoration(labelText: 'Gender'),
                  items: genderList.map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedGender = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Date of Birth
                TextFormField(
                  controller: dobController,
                  decoration: const InputDecoration(
                    labelText: "Date of Birth (YYYY-MM-DD)",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of birth';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Blood Group
                TextFormField(
                  controller: bloodGroupController,
                  decoration: const InputDecoration(
                    labelText: "Blood Group",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Guardian Details
                TextFormField(
                  controller: guardianNameController,
                  decoration: const InputDecoration(
                    labelText: "Guardian Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: guardianRelationController,
                  decoration: const InputDecoration(
                    labelText: "Guardian Relation",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: guardianPhoneController,
                  decoration: const InputDecoration(
                    labelText: "Guardian Phone",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                // Course
                TextFormField(
                  controller: courseController,
                  decoration: const InputDecoration(
                    labelText: "Course",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Address
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Phone Number
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
  onPressed: () {
    // Navigate to HomePage after login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StudentHomePage()),
    );
  },
  child: const Text('Submit'),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
