import 'package:flutter/material.dart';

class MarkEntryPage extends StatefulWidget {
  const MarkEntryPage({super.key});

  @override
  State<MarkEntryPage> createState() => _MarkEntryPageState();
}

class _MarkEntryPageState extends State<MarkEntryPage> {
  final List<Map<String, dynamic>> _students = [
    {
      'name': '',
      'marks': {'Math': 0, 'Science': 0, 'English': 0},
      'total': 0,
      'percentage': 0.0,
      'cgpa': 0.0,
      'grade': ''
    },
  ];

  void _addStudent() {
    setState(() {
      _students.add({
        'name': '',
        'marks': {'Math': 0, 'Science': 0, 'English': 0},
        'total': 0,
        'percentage': 0.0,
        'cgpa': 0.0,
        'grade': ''
      });
    });
  }

  void _removeStudent(int index) {
    setState(() {
      _students.removeAt(index);
    });
  }

  void _calculateTotalAndGrade(int index) {
    final marks = _students[index]['marks'] as Map<String, int>;

    // Calculate total marks obtained by the student
    int totalMarks = marks.values.reduce((a, b) => a + b); // Summing the marks

    // Assuming the max possible marks per subject is 100
    int totalMaxMarks = marks.length * 100; // 100 is the max marks per subject
    double percentage = (totalMarks / totalMaxMarks) * 100; // Calculating percentage

    // Calculate CGPA based on percentage (CGPA = Percentage / 9.5)
    double cgpa = percentage / 9.5;

    // Assigning grade based on percentage
    String grade;
    if (percentage >= 90) {
      grade = 'A+';
    } else if (percentage >= 80) {
      grade = 'A';
    } else if (percentage >= 70) {
      grade = 'B';
    } else if (percentage >= 60) {
      grade = 'C';
    } else {
      grade = 'D';
    }

    setState(() {
      _students[index]['total'] = totalMarks; // Store total marks obtained
      _students[index]['percentage'] = percentage; // Store percentage
      _students[index]['cgpa'] = cgpa; // Store CGPA
      _students[index]['grade'] = grade; // Store grade
    });
  }

  void _addSubject(int index) {
    setState(() {
      _students[index]['marks']['NSS'] = 0; // Adding NSS subject with initial marks of 0
    });
    _calculateTotalAndGrade(index); // Recalculate total and grade
  }

  // Method to add new subjects dynamically
  void _addMoreSubject(int index, String subjectName) {
    setState(() {
      _students[index]['marks'][subjectName] = 0; // Add new subject with 0 marks
    });
    _calculateTotalAndGrade(index); // Recalculate total and grade after adding new subject
  }

  void _submitMarks() {
    for (var student in _students) {
      print('Student: ${student['name']}, Total: ${student['total']}, Percentage: ${student['percentage']}, CGPA: ${student['cgpa']}, Grade: ${student['grade']}');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Marks saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark Entry'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            onChanged: (value) {
                              _students[index]['name'] = value;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Student Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Column(
                            children: (_students[index]['marks'] as Map<String, int>).keys.map((subject) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    int mark = int.tryParse(value) ?? 0;
                                    _students[index]['marks'][subject] = mark;
                                    _calculateTotalAndGrade(index); // Recalculate total and grade
                                  },
                                  decoration: InputDecoration(
                                    labelText: '$subject Marks',
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16.0),
                          Text('Total Marks: ${_students[index]['total']}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Percentage: ${_students[index]['percentage'].toStringAsFixed(2)}%',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('CGPA: ${_students[index]['cgpa'].toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Grade: ${_students[index]['grade']}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16.0),
                          if (_students.length > 1)
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => _removeStudent(index),
                                child: const Text(
                                  'Remove Student',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () => _addSubject(index),
                            child: const Text('Add NSS or Other Subject'),
                          ),
                          const SizedBox(height: 16.0),
                          // Add More Subjects Button
                          TextField(
                            onSubmitted: (subjectName) {
                              if (subjectName.isNotEmpty) {
                                _addMoreSubject(index, subjectName);
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Add More Subjects',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _addStudent,
                  child: const Text('Add Student'),
                ),
                ElevatedButton(
                  onPressed: _submitMarks,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Submit Marks'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
