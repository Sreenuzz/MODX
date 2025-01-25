import 'package:flutter/material.dart';

void main() {
  runApp(TeacherNoticeApp());
}

class TeacherNoticeApp extends StatelessWidget {
  const TeacherNoticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teacher Notice Viewer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TeacherNoticeHomePage(),
    );
  }
}

class TeacherNoticeHomePage extends StatelessWidget {
  final List<Map<String, String>> notices = [
    {
      'title': 'New Class Schedule',
      'date': '2025-01-25',
      'content': 'The new semester class schedules are updated. Please check the faculty portal for your updated schedule.'
    },
    {
      'title': 'Faculty Meeting',
      'date': '2025-01-28',
      'content': 'There will be a mandatory faculty meeting on January 30th at 10:00 AM in the conference room.'
    },
    {
      'title': 'Assignment Submission Deadline',
      'date': '2025-01-22',
      'content': 'All faculty members are requested to submit their student assignments by February 5th.'
    },
    {
      'title': 'Holiday Announcement',
      'date': '2025-01-20',
      'content': 'The school will remain closed on January 26th in observance of Republic Day.'
    },
    {
      'title': 'Equipment Maintenance',
      'date': '2025-01-18',
      'content': 'There will be equipment maintenance in the science labs on January 27th.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Notices'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentHomePage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(notices[index]['title']!),
              subtitle: Text('Date: ${notices[index]['date']}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TeacherNoticeDetailsPage(notice: notices[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TeacherNoticeDetailsPage extends StatelessWidget {
  final Map<String, String> notice;

  const TeacherNoticeDetailsPage({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice['title']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${notice['date']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const Divider(height: 20, thickness: 1),
            Text(
              notice['content']!,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            // Back to Previous Page Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Notices'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentHomePage(),
              ),
            );
          },
          child: const Text('Go to Student Home Page'),
        ),
      ),
    );
  }
}
