import 'package:flutter/material.dart';

import 'studentpage.dart';

class MarkAttendancePages extends StatefulWidget {
  const MarkAttendancePages({super.key});

  @override
  _MarkAttendancePagesState createState() => _MarkAttendancePagesState();
}

class _MarkAttendancePagesState extends State<MarkAttendancePages> {
  // List to simulate attendance hours
  List<String> hours = [
    "8:00 AM - 9:00 AM",
    "9:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "1:00 PM - 2:00 PM",
    "2:00 PM - 3:00 PM",
    "3:00 PM - 4:00 PM",
  ];

  // Track registered attendance for each hour
  Map<String, bool> attendanceRegistered = {};

  String _statusMessage = "Please register attendance for each hour.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mark Attendance"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Status message
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, const Color.fromARGB(255, 161, 147, 147)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                _statusMessage,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Hourly attendance list
            Expanded(
              child: ListView.builder(
                itemCount: hours.length,
                itemBuilder: (context, index) {
                  return _buildHourlyAttendanceCard(hours[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hourly attendance card with "Register Attendance" button
  Widget _buildHourlyAttendanceCard(String hour) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display hour
            Text(
              hour,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Register button
            ElevatedButton(
              onPressed: () {
                _registerAttendance(hour);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: attendanceRegistered[hour] == true
                    ? Colors.green
                    : Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                attendanceRegistered[hour] == true
                    ? "Attendance Registered"
                    : "Register Attendance",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Register attendance for a specific hour
  void _registerAttendance(String hour) {
    setState(() {
      attendanceRegistered[hour] = true;
      _statusMessage = "Attendance registered for: $hour";
    });
  }
}
void main() => runApp(const StudentPage());