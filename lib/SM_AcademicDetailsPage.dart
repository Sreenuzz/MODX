import 'package:flutter/material.dart';

class AcademicDetailsCompletionPage extends StatefulWidget {
  const AcademicDetailsCompletionPage({Key? key}) : super(key: key);

  @override
  _AcademicDetailsCompletionPageState createState() =>
      _AcademicDetailsCompletionPageState();
}

class _AcademicDetailsCompletionPageState
    extends State<AcademicDetailsCompletionPage> {
  final _formKey = GlobalKey<FormState>();
  final _courseController = TextEditingController();
  final _yearController = TextEditingController();
  final _gradeController = TextEditingController();
  String? _selectedSemester; // For semester selection

  @override
  void dispose() {
    _courseController.dispose();
    _yearController.dispose();
    _gradeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedSemester != null) {
      // Perform any required actions upon form submission (e.g., saving to a database)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Success"),
          content: const Text("Academic details submitted successfully!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the previous page
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else if (_selectedSemester == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a semester")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Academic Details"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please complete your academic details to proceed.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),

                // Course Name
                TextFormField(
                  controller: _courseController,
                  decoration: InputDecoration(
                    labelText: "Course Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Course name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Year of Study
                TextFormField(
                  controller: _yearController,
                  decoration: InputDecoration(
                    labelText: "Year of Study",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Year of study is required";
                    }
                    if (int.tryParse(value) == null || int.parse(value) < 1) {
                      return "Please enter a valid year";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Semester Selection
                DropdownButtonFormField<String>(
                  value: _selectedSemester,
                  items: [
                    'Semester 1',
                    'Semester 2',
                    'Semester 3',
                    'Semester 4',
                    'Semester 5',
                    'Semester 6',
                    'Semester 7',
                    'Semester 8',
                  ].map((semester) {
                    return DropdownMenuItem(
                      value: semester,
                      child: Text(semester),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSemester = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Semester",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Semester is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Grade/CGPA
                TextFormField(
                  controller: _gradeController,
                  decoration: InputDecoration(
                    labelText: "Grade/CGPA",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Grade/CGPA is required";
                    }
                    if (double.tryParse(value) == null) {
                      return "Please enter a valid grade/CGPA";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      "Submit Details",
                      style: TextStyle(fontSize: 18),
                    ),
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
