import 'package:flutter/material.dart';

void main() {
  runApp(NoticeApp());
}

class NoticeApp extends StatelessWidget {
  const NoticeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notice Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoticeHomePage(),
    );
  }
}

class NoticeHomePage extends StatefulWidget {
  @override
  _NoticeHomePageState createState() => _NoticeHomePageState();
}

class _NoticeHomePageState extends State<NoticeHomePage> {
  final Map<String, List<Map<String, String>>> categorizedNotices = {
    'Holidays': [
      {
        'title': 'Holiday Announcement',
        'date': '2025-01-20',
        'content': 'The college will remain closed on January 26th for Republic Day.'
      },
    ],
    'Exams': [
      {
        'title': 'Exam Schedule',
        'date': '2025-01-18',
        'content': 'The mid-term exams will commence from February 10th. Please check the timetable on the notice board.'
      },
    ],
    'Events': [
      {
        'title': 'Workshop on AI',
        'date': '2025-01-15',
        'content': 'A workshop on Artificial Intelligence will be conducted on January 30th in the auditorium.'
      },
    ],
    'Others': [
      {
        'title': 'General Maintenance',
        'date': '2025-01-10',
        'content': 'The library will be closed for maintenance on January 25th from 9 AM to 4 PM.'
      },
      {
        'title': 'Lost and Found',
        'date': '2025-01-05',
        'content': 'A wallet was found near the auditorium. Please visit the office to claim it.'
      },
    ],
  };

  String selectedCategory = 'Holidays';

  @override
  Widget build(BuildContext context) {
    final notices = categorizedNotices[selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'),
      ),
      body: Column(
        children: [
          // Category Buttons
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categorizedNotices.keys.map((category) {
                final isSelected = category == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: notices.isEmpty
                ? Center(
                    child: Text(
                      'No notices available.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(notices[index]['title']!),
                          subtitle: Text('Date: ${notices[index]['date']}'),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NoticeDetailsPage(notice: notices[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class NoticeDetailsPage extends StatelessWidget {
  final Map<String, String> notice;

  NoticeDetailsPage({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${notice['date']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Divider(height: 20, thickness: 1),
            Text(
              notice['content']!,
              style: TextStyle(fontSize: 16),
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
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
