import 'package:flutter/material.dart';

import 'Student Profile Verification.dart';

void main() {
  runApp(StudentProfilesApp());
}

class StudentProfilesApp extends StatelessWidget {
  const StudentProfilesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentProfilesPage(),
    );
  }
}

class StudentProfilesPage extends StatefulWidget {
  @override
  _StudentProfilesPageState createState() => _StudentProfilesPageState();
}

class _StudentProfilesPageState extends State<StudentProfilesPage> {
  final List<Map<String, String>> profiles = [
    {"name": "sree", "images": "assets/images/sree.jpg"},

    {"name": "moda", "images": "assets/images/sky.png"},

    {"name": "Jeo", "images": "assets/images/libin.jpg"},

    {"name": "nidheeeee", "images": "assets/images/nidhee.jpg"},

    {"name": "Sreenesh A", "images": "assets/images/sree.jpg"},

    {"name": "pachu", "images": "assets/images/pachu.jpg"},

    {"name": "vikash", "images": "assets/images/sree.jpg"},

    {"name": "Libin Kumar", "images": "assets/images/libin.png"},

    {"name": "sathi", "images": "assets/images/libin.jpg"},

    {"name": "sree", "images": "assets/images/sree.jpg"},

    {"name": "moda", "images": "assets/images/sky.png"},

    {"name": "Jeo", "images": "assets/images/libin.jpg"},

    {"name": "nidheeeee", "images": "assets/images/nidhee.jpg"},

    {"name": "Sreenesh A", "images": "assets/images/sree.jpg"},

    {"name": "pachu", "images": "assets/images/pachu.jpg"},

    {"name": "vikash", "images": "assets/images/sree.jpg"},
    
    {"name": "Libin Kumar", "images": "assets/images/libin.png"},
    
    {"name": "sathi", "images": "assets/images/libin.jpg"},
  ];

  List<Map<String, String>> filteredProfiles = [];

  @override
  void initState() {
    super.initState();
    filteredProfiles = profiles;
  }

  void _filterProfiles(String query) {
    final results = profiles.where((profile) {
      final name = profile["name"]!.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() {
      filteredProfiles = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search Students...",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: _filterProfiles,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: filteredProfiles.length,
          itemBuilder: (context, index) {
            final profile = filteredProfiles[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(profile["images"]!),
              ),
              title: Text(
                profile["name"]!,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentProfileVerificationPage(
                              profile: {
                                'images': 'assets/images/pachu.jpg',
                                'ClassName': 'Computer Science',
                                'StudentName': 'John Doe',
                                'Admission_no': 'A123456',
                                'Department': 'Engineering',
                                'Semester': '6',
                                'BatchYear': '2021-2025',
                                'Gender': 'Male',
                                'Date_of_birth': '2003-05-15',
                                'Blood_group': 'O+',
                                'Guardian_name': 'Jane Doe',
                                'Guardian_relation': 'Mother',
                                'Guardian_phone': '9876543210',
                                'Course': 'B.Tech',
                                'Email': 'johndoe@example.com',
                                'Address': '123 Main Street, City',
                                'Phone_number': '1234567890',
                              },
                            ),
                          ),
                        );

                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
