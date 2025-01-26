import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceScreen extends StatefulWidget {
  @override
  _PerformanceScreenState createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final TextEditingController _studentIdController = TextEditingController();

  // Sample data (you can fetch this from an API or database)
  final Map<String, dynamic> studentData = {
    'studentId': '12345',
    'examMarks': 75, // Marks out of 100
    'attendance': 85, // Percentage
    'assignments': 80, // Marks out of 100
    'seminars': 70, // Marks out of 100
  };

  String performanceFeedback = '';

  // Function to get performance feedback
  void _evaluatePerformance() {
    double avgPerformance = (studentData['examMarks'] +
            studentData['attendance'] +
            studentData['assignments'] +
            studentData['seminars']) /
        4;

    if (avgPerformance >= 80) {
      performanceFeedback = 'Good';
    } else if (avgPerformance >= 60) {
      performanceFeedback = 'Nice';
    } else if (avgPerformance >= 40) {
      performanceFeedback = 'Intermediate';
    } else {
      performanceFeedback = 'Bad';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Performance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Student Register Number',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _studentIdController,
              decoration: InputDecoration(
                labelText: 'Student Register Number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _evaluatePerformance,
              child: Text('Analyze Performance'),
            ),
            SizedBox(height: 20),
            if (performanceFeedback.isNotEmpty) ...[
              Text(
                'Performance Feedback: $performanceFeedback',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
            ],
            Text('Performance Graph', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, studentData['examMarks'] / 10), // Exam marks scaled
                        FlSpot(1, studentData['attendance'] / 10), // Attendance scaled
                        FlSpot(2, studentData['assignments'] / 10), // Assignment marks scaled
                        FlSpot(3, studentData['seminars'] / 10), // Seminar marks scaled
                      ],
                      isCurved: true,
                      color: Colors.blue, // Use a single color here
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
