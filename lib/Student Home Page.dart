import 'package:flutter/material.dart';

import 'SM_leave_application_page.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _currentIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    HomePage(), // Main student home page
    LeaveApplicationPage(), // Leave Application page
    PerformancePage(), // Add your custom performance page here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Home Page'),
          centerTitle: true,
          elevation: 0,
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber[800], // Gold for the selected icon
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black, // Black background for navigation
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leave_bags_at_home),
              label: 'Leave',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Performance',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          _buildProfileSection(),
          SizedBox(height: 16),

          // Features Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildFeatureCard(
                icon: Icons.calendar_today,
                title: 'View Attendance',
                color: Colors.greenAccent,
                onTap: () {
                  // Navigate to View Attendance Page
                },
              ),
              _buildFeatureCard(
                icon: Icons.note_alt,
                title: 'View Notes',
                color: Colors.orangeAccent,
                onTap: () {
                  // Navigate to View Notes Page
                },
              ),
              _buildFeatureCard(
                icon: Icons.message,
                title: 'Class Teacher Message',
                color: Colors.blueAccent,
                onTap: () {
                  // Navigate to Class Teacher Message Page
                },
              ),
              _buildFeatureCard(
                icon: Icons.school,
                title: 'Semester Results',
                color: Colors.purpleAccent,
                onTap: () {
                  // Navigate to Semester Results Page
                },
              ),
              _buildFeatureCard(
                icon: Icons.leave_bags_at_home,
                title: 'Apply Leave',
                color: Colors.redAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LeaveApplicationPage(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                icon: Icons.show_chart,
                title: 'Your Performance',
                color: Colors.tealAccent,
                onTap: () {
                  // Navigate to Your Performance Page
                },
              ),
              _buildFeatureCard(
                icon: Icons.schedule,
                title: 'Time Table',
                color: Colors.yellowAccent,
                onTap: () {
                  // Navigate to Time Table Page
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
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
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/student.jpg'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('Roll No: 12345', style: TextStyle(color: Colors.grey[600])),
              SizedBox(height: 4),
              Text('Class: BSc Nursing', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Performance Page',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
