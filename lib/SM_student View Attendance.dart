import 'package:flutter/material.dart';

import 'studentpage.dart';

class ViewAttendancePage extends StatelessWidget {
  const ViewAttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data with weekly attendance for a month
    final attendanceData = [
      {
        'week': '1',
        'percentage': 87.50,
        'status': Colors.green,
      },
      {
        'week': '2',
        'percentage': 79.25,
        'status': Colors.yellow,
      },
      {
        'week': '3',
        'percentage': 82.14,
        'status': Colors.green,
      },
      {
        'week': '4',
        'percentage': 74.45,
        'status': Colors.red,
      },
      {
        'week': '5',
        'percentage': 91.62,
        'status': Colors.green,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Attendance'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top profile and summary card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with actual image path
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe", // Replace dynamically if needed
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "80.25%\nYou need to attend 18 classes more.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Attendance details cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: attendanceData.length,
              itemBuilder: (context, index) {
                final item = attendanceData[index];
                return _buildAttendanceCard(
                  week: item['week'] as String,
                  percentage: item['percentage'] as double,
                  statusColor: item['status'] as Color,
                  onTap: () {
                    // Handle "More" button tap here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("More details for Week ${item['week']}")),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard({
    required String week,
    required double percentage,
    required Color statusColor,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: statusColor,
          child: Text(
            "${percentage.toStringAsFixed(2)}%",
            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          "Week $week",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: TextButton(
          onPressed: onTap,
          child: const Text(
            "More",
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
void main() => runApp(const StudentPage());