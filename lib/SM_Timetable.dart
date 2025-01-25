import 'package:flutter/material.dart';

void main() => runApp(const TimetableApp());

class TimetableApp extends StatelessWidget {
  const TimetableApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the table timetable
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TableTimetablePage()),
                );
              },
              child: const Text('Table Timetable'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the list timetable
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListTimetablePage()),
                );
              },
              child: const Text('List Timetable'),
            ),
          ],
        ),
      ),
    );
  }
}

class TableTimetablePage extends StatelessWidget {
  const TableTimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("S6CS Timetable")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.black),
          children: [
            // Header row
            _buildRow(['Day', 'Slot 1', 'Slot 2', 'Slot 3', 'Slot 4', 'Slot 5'],
                isHeader: true),
            // Data rows
            _buildRow(['Monday', 'CD', 'CO', 'IS', 'CD', 'CN']),
            _buildRow(['Tuesday', 'CO', 'CD', 'CN', 'Java Lab', '']),
            _buildRow(['Wednesday', 'CN', 'CD', 'IS', 'CN', 'Project']),
            _buildRow(['Thursday', 'IS', 'CO', 'IS', 'Python Lab', '']),
            _buildRow(['Friday', '', '', '', 'Project', '']),
          ],
        ),
      ),
    );
  }

  TableRow _buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          color: isHeader ? Colors.grey[300] : Colors.white,
          child: Text(
            cell,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: 14.0,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ListTimetablePage extends StatelessWidget {
  const ListTimetablePage({Key? key}) : super(key: key);

  final List<Map<String, String>> timetable = const [
    {
      'time': '9:00 AM - 10:00 AM',
      'subject': 'Data Structures',
      'teacher': 'Mr. Anil Kumar',
      'room': 'Lab 201',
    },
    {
      'time': '10:15 AM - 11:15 AM',
      'subject': 'Operating Systems',
      'teacher': 'Dr. Priya Sharma',
      'room': 'Room 202',
    },
    {
      'time': '11:30 AM - 12:30 PM',
      'subject': 'Database Systems',
      'teacher': 'Ms. Nisha Verma',
      'room': 'Lab 203',
    },
    {
      'time': '1:30 PM - 2:30 PM',
      'subject': 'Web Development',
      'teacher': 'Mr. Ramesh Iyer',
      'room': 'Lab 204',
    },
    {
      'time': '2:45 PM - 3:45 PM',
      'subject': 'Computer Networks',
      'teacher': 'Dr. Sneha Raj',
      'room': 'Room 205',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Timetable'),
      ),
      body: ListView.builder(
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final entry = timetable[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                '${entry['subject']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Teacher: ${entry['teacher']}\nRoom: ${entry['room']}\nTime: ${entry['time']}',
              ),
              leading: CircleAvatar(
                child: Text(entry['subject']![0]),
              ),
            ),
          );
        },
      ),
    );
  }
}
