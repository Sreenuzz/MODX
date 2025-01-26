import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ViewAttendanceStudentPage extends StatefulWidget {
  const ViewAttendanceStudentPage({Key? key}) : super(key: key);

  @override
  _ViewAttendanceStudentPageState createState() =>
      _ViewAttendanceStudentPageState();
}

class _ViewAttendanceStudentPageState extends State<ViewAttendanceStudentPage> {
  // Sample Data for Attendance
  List<int> attendanceData = [80, 30, 70, 90, 50, 60, 85];
  double progress = 0.5; // For progress bar animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Performance'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildAttendancePieChart(),
              SizedBox(height: 20),
              _buildDynamicDataCard(),
              SizedBox(height: 20),
              _buildBarChart(),
              SizedBox(height: 20),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Pie chart to represent the attendance
  Widget _buildAttendancePieChart() {
    return Card(
      color: Colors.black.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: attendanceData[0].toDouble(),
                  color: Colors.green,
                  title: 'Present: ${attendanceData[0]}%',
                  radius: 80,
                ),
                PieChartSectionData(
                  value: attendanceData[1].toDouble(),
                  color: Colors.red,
                  title: 'Absent: ${attendanceData[1]}%',
                  radius: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Card with dynamic data
  Widget _buildDynamicDataCard() {
    return Card(
      color: Colors.black.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Attendance Performance Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: progress * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Class Average: ${attendanceData[2]}%',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bar Chart to display individual student attendance
  Widget _buildBarChart() {
    return Card(
      color: Colors.black.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(show: true),
              borderData: FlBorderData(show: true, border: Border.all(color: Colors.white.withOpacity(0.3))),
              barGroups: attendanceData
                  .map((data) => BarChartGroupData(x: attendanceData.indexOf(data), barRods: [
                        BarChartRodData(
                          toY: data.toDouble(),
                          color: Colors.green,
                          width: 20,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  // Floating Action Button to update attendance data
  Widget _buildActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Simulating dynamic data change
        setState(() {
          attendanceData = [
            (attendanceData[0] + 10) % 100,
            (attendanceData[1] + 10) % 100,
            (attendanceData[2] + 10) % 100,
            (attendanceData[3] + 10) % 100,
            (attendanceData[4] + 10) % 100,
            (attendanceData[5] + 10) % 100,
            (attendanceData[6] + 10) % 100,
          ];
          progress = (attendanceData[2] / 100.0); // Simulate progress change
        });
      },
      child: Icon(Icons.refresh),
      backgroundColor: Colors.blueAccent,
    );
  }
}
