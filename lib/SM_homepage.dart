import 'package:flutter/material.dart';
import 'package:modx/view_attendance_page.dart';
import 'SM_Admin Notification Page.dart';
import 'GroupofStudentsProfiles.dart';
import 'SM_Notice Viewing Page.dart';
import 'Notices_page.dart';
import 'SM_Sem result Upload.dart';
import 'SM_Student Mark Attendance.dart';
import 'TeacherNotice.DART';
import 'SM_Timetable.dart';
import 'SM_leave_application_page.dart';
import 'SM_profile_page.dart';
import 'SM_student View Attendance.dart';
import 'SM_view_notes_page.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  String _welcomeMessage = "Welcome, Student!";
  double attendanceProgress = 0.75; // Example: 75% attendance progress
  int assignmentsPending = 3;
  int notices = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Welcome card
            _buildWelcomeCard(),

            const SizedBox(height: 20),

            // Highlights (Attendance, Assignments, Notices)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHighlightCard(
                  title: "Attendance",
                  value: "${(attendanceProgress * 100).toInt()}%",
                  progress: attendanceProgress,
                  color: Colors.greenAccent,
                  width: 110, // Adjust the width
                  height: 150, // Adjust the height
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAttendancePage(),
                      ),
                    );
                  },
                ),
                _buildHighlightCard(
                  title: "Assignments",
                  value: "$assignmentsPending",
                  icon: Icons.assignment,
                  color: Colors.yellowAccent,
                  width: 130, // Set the width consistent with the other cards
                  height: 150, // Ensure the height is also consistent
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewAttendancePage(),
                      ),
                    );
                  },
                ),
                _buildHighlightCard(
                  title: "Notices",
                  value: "$notices",
                  icon: Icons.notifications,
                  color: Colors.redAccent,
                  width: 80, // Adjust the width
                  height: 150, // Adjust the height
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NoticeApp(),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Teacher and Admin Notices Section
            _buildNoticesSection(context),

            const SizedBox(height: 20),

            // Profile Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileCompletionPage()), // Navigate to Profile Page
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.account_circle, color: Colors.blueAccent, size: 28),
                    SizedBox(width: 20),
                    Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Feature buttons
            _buildFeatureButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _welcomeMessage,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Check your progress and manage your tasks below.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightCard({
    required String title,
    required String value,
    double? progress,
    IconData? icon,
    required Color color,
    required VoidCallback onTap,
    required double width,
    required double height,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (progress != null)
              CircularProgressIndicator(
                value: progress,
                color: color,
                backgroundColor: Colors.grey,
                strokeWidth: 6,
              ),
            if (icon != null) Icon(icon, color: color, size: 36),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notices",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 10),
        // Use a wrap to ensure the notices are aligned properly
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            _buildNoticeCard(
              title: "Teacher Notices",
              icon: Icons.school,
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoticeApp()),
                );
              },
            ),
            _buildNoticeCard(
              title: "Admin Notices",
              icon: Icons.admin_panel_settings,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeacherNoticeApp()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNoticeCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButtons(BuildContext context) {
    List<Map<String, dynamic>> features = [
      {"icon": Icons.notifications, "label": "Admin Notices", "route": NotificationViewingPage()},
      {"icon": Icons.book, "label": "View Notes", "route": CSStudentNotesPage()},
      {"icon": Icons.calendar_month, "label": "Apply for Leave", "route": const LeaveApplicationPage()},
      {"icon": Icons.check_circle, "label": "Mark Attendance", "route": const MarkAttendancePages()},
      {"icon": Icons.bar_chart, "label": "View Attendance", "route": const ViewAttendancePage()},
      {"icon": Icons.upload, "label": "Upload PDF", "route": const UploadPDFPage()},
      {"icon": Icons.schedule, "label": "Timetable", "route": const TableTimetablePage()},
      {"icon": Icons.school, "label": "Teacher Notices", "route": const NoticeApp()},
    ];

    return Column(
      children: features.map((feature) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => feature["route"]),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(feature["icon"], color: Colors.blueAccent, size: 28),
                const SizedBox(width: 20),
                Text(
                  feature["label"],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
