import 'package:flutter/material.dart';

class StudentTestResultPage extends StatelessWidget {
 
  final String studentName = "John Doe"; // Example student name
  final String rollNumber = "12345"; // Example roll number
  final List<TestResult> testResults = [
    TestResult(testName: "Math Test", obtainedMarks: 45, totalMarks: 50),
    TestResult(testName: "Physics Test", obtainedMarks: 40, totalMarks: 50),
    TestResult(testName: "Chemistry Test", obtainedMarks: 38, totalMarks: 50),
    TestResult(testName: "Biology Test", obtainedMarks: 47, totalMarks: 50),
    TestResult(testName: "English Test", obtainedMarks: 42, totalMarks: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test Results'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Information Section
            _buildStudentInfo(),
            SizedBox(height: 16),

            // Test Results List
            Expanded(
              child: ListView.builder(
                itemCount: testResults.length,
                itemBuilder: (context, index) {
                  final result = testResults[index];
                  return _buildResultCard(result);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student Name: $studentName',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Roll Number: $rollNumber',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(TestResult result) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                result.testName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Marks: ${result.obtainedMarks}/${result.totalMarks}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          _buildProgressIndicator(result.obtainedMarks, result.totalMarks),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(int obtainedMarks, int totalMarks) {
    final percentage = obtainedMarks / totalMarks;
    return Column(
      children: [
        Text(
          '${(percentage * 100).toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: percentage >= 0.5 ? Colors.green : Colors.red,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 8,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                percentage >= 0.5 ? Colors.green : Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TestResult {
  final String testName;
  final int obtainedMarks;
  final int totalMarks;

  TestResult({
    required this.testName,
    required this.obtainedMarks,
    required this.totalMarks,
  });
}
