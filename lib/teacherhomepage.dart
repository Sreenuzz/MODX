import 'package:flutter/material.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});
  
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  int _currentIndex = 0;
  bool _isDarkMode = true; // Toggles between dark and light mode

  // List of dynamic options displayed as cards on the home page
  final List<Map<String, dynamic>> _options = [
    {
      'title': 'Setup Your Class',
      'icon': Icons.class_,
      'onTap': () => print('Setup Your Class'),
    },
    {
      'title': 'View Your Students',
      'icon': Icons.group,
      'onTap': () => print('View Your Students'),
    },
    {
      'title': 'Approve Attendance',
      'icon': Icons.check_circle_outline,
      'onTap': () => print('Approve Attendance'),
    },
    {
      'title': 'Admin Notifications',
      'icon': Icons.notifications,
      'onTap': () => print('Admin Notifications'),
    },
    {
      'title': 'Review Leave Letters',
      'icon': Icons.description,
      'onTap': () => print('Review Leave Letters'),
    },
    {
      'title': 'Chat with Students',
      'icon': Icons.chat,
      'onTap': () => print('Chat with Students'),
    },
    {
      'title': 'Add Notes',
      'icon': Icons.note_add,
      'onTap': () => print('Add Notes'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = _isDarkMode ? ThemeData.dark() : ThemeData.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/images/ss.png', // Your logo
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Teacher',
                  style: TextStyle(
                    fontSize: 15,
                    color: _isDarkMode ? Colors.white : Colors.black,
                  )),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () => print('Notifications'),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => print('Profile'),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: _isDarkMode ? Colors.black87 : Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ss.png', // Your logo
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Teacher Dashboard',
                      style: TextStyle(
                        fontSize: 10,
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Setup Your Class'),
                leading: Icon(Icons.class_),
                onTap: () => print('Setup Your Class'),
              ),
              ListTile(
                title: Text('View Your Students'),
                leading: Icon(Icons.group),
                onTap: () => print('View Your Students'),
              ),
              ListTile(
                title: Text('Approve Attendance'),
                leading: Icon(Icons.check_circle_outline),
                onTap: () => print('Approve Attendance'),
              ),
              ListTile(
                title: Text('Admin Notifications'),
                leading: Icon(Icons.notifications),
                onTap: () => print('Admin Notifications'),
              ),
              ListTile(
                title: Text('Review Leave Letters'),
                leading: Icon(Icons.description),
                onTap: () => print('Review Leave Letters'),
              ),
              ListTile(
                title: Text('Chat with Students'),
                leading: Icon(Icons.chat),
                onTap: () => print('Chat with Students'),
              ),
              ListTile(
                title: Text('Add Notes'),
                leading: Icon(Icons.note_add),
                onTap: () => print('Add Notes'),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            // Background gradient for a futuristic look
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _isDarkMode
                      ? [Colors.black, Colors.teal.shade900]
                      : [Colors.blue.shade50, Colors.blue.shade200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final option = _options[index];
                  return GestureDetector(
                    onTap: option['onTap'],
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: _isDarkMode ? Colors.black87 : Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: option['title'],
                            child: Icon(
                              option['icon'],
                              size: 50,
                              color: _isDarkMode ? Colors.tealAccent : Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            option['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: _isDarkMode ? Colors.black : Colors.white,
          selectedItemColor: _isDarkMode ? Colors.tealAccent : Colors.blueAccent,
          unselectedItemColor: _isDarkMode ? Colors.white70 : Colors.black54,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(TeacherHomePage());
