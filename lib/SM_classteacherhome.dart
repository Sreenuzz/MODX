import 'package:flutter/material.dart';
import 'SM_attendance_screen.dart'; // Import the Attendance Screen
import 'SM_ce_recommendation.dart';
import 'SM_performance_screen.dart'; // Import the Performance Screen
import 'SM_upload_results_screen.dart'; // Import the Upload Results Screen
import 'SM_messages_screen.dart'; // Import the Messages Screen
import 'SM_leave_screen.dart'; // Import the Leave Applications Screen
import 'SM_student_info_screen.dart'; // Import the Student Info Screen
import 'SM_timetable_screen.dart'; // Import the Timetable Screen
import 'SM_results_screen.dart'; // Import the Results Screen
import 'SM_class_info_screen.dart'; // Import the Class Info Screen

class ClassTeacherHomePage extends StatefulWidget {
  const ClassTeacherHomePage({super.key});
  @override
  _ClassTeacherHomePageState createState() => _ClassTeacherHomePageState();
}

class _ClassTeacherHomePageState extends State<ClassTeacherHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeTab(),
    MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Class Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Profile') {
                  // Navigate to Profile Page
                } else if (value == 'Logout') {
                  // Handle Logout
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                PopupMenuItem(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ],
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.deepPurpleAccent),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.deepPurpleAccent),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
      ),
    );
  }
}

// Home Tab Content
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Verify Attendance
          _buildSectionHeader('Verify Students Attendance', context),
          _buildDynamicCard(
            Icons.check_circle_outline,
            Colors.green,
            'Verify Attendance',
            'Mark or verify attendance for today.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceScreen()),
              );
            },
          ),
          SizedBox(height: 20),

          // Class Attendance
          _buildSectionHeader('Attendance of Your Class', context),
          _buildDynamicCard(
            Icons.group,
            Colors.blue,
            'Class Attendance',
            'View detailed class attendance.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceScreen()),
              );
            },
          ),
          SizedBox(height: 20),

          // Student Performance
          _buildSectionHeader('Student Performance', context),
          _buildDynamicCard(
            Icons.bar_chart,
            Colors.orange,
            'Student Performance',
            'View and analyze performance data.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerformanceScreen()),
              );
            },
          ),
          SizedBox(height: 20),

          // Upload Results
          _buildSectionHeader('Upload Exam Results', context),
          _buildDynamicCard(
            Icons.upload,
            Colors.purple,
            'Upload Exam Results',
            'Add or upload results for students.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadResultsScreen()),
              );
            },
          ),
          SizedBox(height: 20),

          // Add Messages
          _buildSectionHeader('Add Messages/Notices', context),
          _buildDynamicCard(
            Icons.message,
            Colors.teal,
            'Add Messages/Notices',
            'Send important messages to students.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()),
              );
            },
          ),
          SizedBox(height: 20),

          // Leave Applications
          _buildSectionHeader('View Leave Applications', context),
          _buildDynamicCard(
            Icons.assignment,
            Colors.red,
            'Leave Applications',
            'View and manage student leave requests.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeaveScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Section header widget
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }

  // Dynamic card with animation and gradient effect
  Widget _buildDynamicCard(
      IconData icon, Color iconColor, String title, String subtitle, BuildContext context, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [iconColor.withOpacity(0.8), iconColor.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white, size: 40),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}

// More Tab with expanded features
class MoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Students
          _buildSectionHeader('About Your Students', context),
          _buildDynamicCard(
            Icons.school,
            Colors.blue,
            'About Your Students',
            'Get information about your students.',
            context,
            () {
              // Navigate to student info page
            },
          ),
          SizedBox(height: 20),

          // View Timetable
          _buildSectionHeader('View Timetable', context),
          _buildDynamicCard(
            Icons.calendar_today,
            Colors.green,
            'View Timetable',
            'Check or edit the class timetable.',
            context,
            () {
              // Navigate to timetable page
            },
          ),
          SizedBox(height: 20),

          // View Results
          _buildSectionHeader('View Results', context),
          _buildDynamicCard(
            Icons.bar_chart,
            Colors.orange,
            'View Results',
            'View and manage student results.',
            context,
            () {
              // Navigate to results page
            },
          ),
          SizedBox(height: 20),

          // About Class
          _buildSectionHeader('About Your Class', context),
          _buildDynamicCard(
            Icons.class_,
            Colors.purple,
            'About Your Class',
            'View class details and teacher information.',
            context,
            () {
              // Navigate to class details page
            },
          ),
          SizedBox(height: 20),

          // CE Mark Recommendation
          _buildSectionHeader('CE Mark Recommendation', context),
          _buildDynamicCard(
            Icons.recommend,
            Colors.red,
            'CE Mark Recommendation',
            'View and manage CE mark recommendations.',
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CEMarkRecommendationPage(),
                ),
              );
            },
          ),
          SizedBox(height: 20),

          // View Class Attendance
          _buildSectionHeader('View Class Attendance', context),
          _buildDynamicCard(
            Icons.list_alt,
            Colors.teal,
            'View Class Attendance',
            'View detailed class attendance information.',
            context,
            () {
              // Navigate to class attendance page
            },
          ),
        ],
      ),
    );
  }

  // Section header widget
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 22),
      ),
    );
  }

  // Dynamic card with animation
  Widget _buildDynamicCard(
      IconData icon, Color iconColor, String title, String subtitle, BuildContext context, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [iconColor.withOpacity(0.8), iconColor.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white, size: 40),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}
