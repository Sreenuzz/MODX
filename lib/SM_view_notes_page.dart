import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: CSStudentNotesPage(),
//   ));
// }

class CSStudentNotesPage extends StatelessWidget {


  // List of CS subjects
  final List<String> csSubjects = [
    "Data Structures and Algorithms",
    "Database Management Systems",
    "Operating Systems",
    "Computer Networks",
    "Artificial Intelligence",
    "Software Engineering",
    "Web Development",
    "Mobile Application Development",
    "Machine Learning",
    "Cybersecurity",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CS Student - View Notes"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: csSubjects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                csSubjects[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.deepPurple),
              onTap: () {
                // Navigate to the notes page for the selected CS subject
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubjectDetailPage(subject: csSubjects[index]),
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

class SubjectDetailPage extends StatelessWidget {
  final String subject;

  const SubjectDetailPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$subject Notes"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$subject Notes",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  // Example notes for the subject
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.deepPurple),
                    title: const Text(
                      "Chapter 1: Introduction",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      // Placeholder for viewing Chapter 1 notes
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Opening Chapter 1 Notes...")),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.deepPurple),
                    title: const Text(
                      "Chapter 2: Advanced Concepts",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      // Placeholder for viewing Chapter 2 notes
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Opening Chapter 2 Notes...")),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.deepPurple),
                    title: const Text(
                      "Chapter 3: Practice Problems",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      // Placeholder for viewing Chapter 3 notes
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Opening Chapter 3 Notes...")),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book, color: Colors.deepPurple),
                    title: const Text(
                      "Extra Resources",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      // Placeholder for viewing extra resources
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Opening Extra Resources...")),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
