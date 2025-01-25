// import 'package:flutter/material.dart';

// class TeacherDashboardPage extends StatelessWidget {
//   const TeacherDashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Teacher Dashboard"),
//         centerTitle: true,
//         backgroundColor: Colors.grey[900],
//       ),
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Welcome Header
//             _buildWelcomeHeader(),

//             const SizedBox(height: 20),

//             // Notice Section
//             _buildNoticeSection(context),

//             const SizedBox(height: 20),

//             // Navigation Buttons Section
//             _buildNavigationSection(context),
//           ],
//         ),
//       ),
//     );
//   }

//   // Welcome Header Widget
//   Widget _buildWelcomeHeader() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Colors.teal, Colors.green],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.teal.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             "Welcome, Teacher!",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "Manage your classes, notices, and more.",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Notice Section Widget
//   Widget _buildNoticeSection(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Notices",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white70,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildNoticeCard(
//               title: "Teacher Notices",
//               icon: Icons.notifications,
//               color: Colors.blue,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const TeacherNoticesPage()),
//                 );
//               },
//             ),
//             _buildNoticeCard(
//               title: "Admin Notices",
//               icon: Icons.admin_panel_settings,
//               color: Colors.orange,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const AdminNoticesPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   // Individual Notice Card
//   Widget _buildNoticeCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 160,
//         height: 120,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.grey[850],
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: color, size: 40),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white70,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Navigation Section Widget
//   Widget _buildNavigationSection(BuildContext context) {
//     List<Map<String, dynamic>> navigationItems = [
//       {"icon": Icons.book, "label": "Manage Classes", "route": const ManageClassesPage()},
//       {"icon": Icons.upload, "label": "Upload Notes", "route": const UploadNotesPage()},
//       {"icon": Icons.event, "label": "Timetable", "route": const TimetablePage()},
//       {"icon": Icons.check_circle, "label": "Attendance", "route": const AttendancePage()},
//     ];

//     return Column(
//       children: navigationItems.map((item) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => item["route"]),
//             );
//           },
//           child: Container(
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.grey[850],
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blueAccent.withOpacity(0.2),
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Icon(item["icon"], color: Colors.blueAccent, size: 28),
//                 const SizedBox(width: 20),
//                 Text(
//                   item["label"],
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const Spacer(),
//                 const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// // Placeholder pages for navigation
// class TeacherNoticesPage extends StatelessWidget {
//   const TeacherNoticesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Teacher Notices"),
//       ),
//       body: const Center(
//         child: Text("Teacher Notices Page"),
//       ),
//     );
//   }
// }

// class AdminNoticesPage extends StatelessWidget {
//   const AdminNoticesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Admin Notices"),
//       ),
//       body: const Center(
//         child: Text("Admin Notices Page"),
//       ),
//     );
//   }
// }

// // Additional placeholder pages
// class ManageClassesPage extends StatelessWidget {
//   const ManageClassesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Manage Classes"),
//       ),
//       body: const Center(
//         child: Text("Manage Classes Page"),
//       ),
//     );
//   }
// }

// class UploadNotesPage extends StatelessWidget {
//   const UploadNotesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Notes"),
//       ),
//       body: const Center(
//         child: Text("Upload Notes Page"),
//       ),
//     );
//   }
// }

// class TimetablePage extends StatelessWidget {
//   const TimetablePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Timetable"),
//       ),
//       body: const Center(
//         child: Text("Timetable Page"),
//       ),
//     );
//   }
// }

// class AttendancePage extends StatelessWidget {
//   const AttendancePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Attendance"),
//       ),
//       body: const Center(
//         child: Text("Attendance Page"),
//       ),
//     );
//   }
// }
