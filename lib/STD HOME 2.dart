// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'leave_application_page.dart';
// import 'view_notes_page.dart'; // Import the View Notes Page
// import 'view_notes_page.dart';

// class StudentHomePages extends StatelessWidget {
//   const StudentHomePages({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Home Page'),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         color: Colors.grey[200],
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Profile Section
//               _buildProfileSection(),
//               const SizedBox(height: 16),

//               // Features Grid
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   _buildFeatureCard(
//                     icon: Icons.calendar_today,
//                     title: 'View Attendance',
//                     color: Colors.greenAccent,
//                     onTap: () {
//                       // Navigate to View Attendance Page
//                     },
//                   ),
//                   _buildFeatureCard(
//                     icon: Icons.note_alt,
//                     title: 'View Notes',
//                     color: Colors.orangeAccent,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const ViewNotesPage(),
//                         ),
//                       ); // Navigate to View Notes Page
//                     },
//                   ),
//                   _buildFeatureCard(
//                     icon: Icons.message,
//                     title: 'Class Teacher Message',
//                     color: Colors.blueAccent,
//                     onTap: () {
//                       // Navigate to Class Teacher Message Page
//                     },
//                   ),
//                   _buildFeatureCard(
//                     icon: Icons.school,
//                     title: 'Semester Results',
//                     color: Colors.purpleAccent,
//                     onTap: () {
//                       // Navigate to Semester Results Page
//                     },
//                   ),
//                   _buildFeatureCard(
//                     icon: Icons.leave_bags_at_home,
//                     title: 'Apply Leave',
//                     color: Colors.redAccent,
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LeaveApplicationPage(),
//                       ),
//                     ), // Navigate to Leave Application Page
//                   ),
//                   _buildFeatureCard(
//                     icon: Icons.show_chart,
//                     title: 'Your Performance',
//                     color: Colors.tealAccent,
//                     onTap: () {
//                       // Navigate to Your Performance Page
//                     },
//                   ),
//                   _buildFeatureCard(
//                     icon: Icons.schedule,
//                     title: 'Time Table',
//                     color: Colors.yellowAccent,
//                     onTap: () {
//                       // Navigate to Time Table Page
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileSection() {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 6,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 40,
//             backgroundImage: AssetImage('assets/student.jpg'), // Replace with actual image
//           ),
//           const SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Student Name',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Text('Roll No: 12345', style: TextStyle(color: Colors.grey[600])),
//               const SizedBox(height: 4),
//               Text('Class: BSc Nursing', style: TextStyle(color: Colors.grey[600])),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureCard({
//     required IconData icon,
//     required String title,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               blurRadius: 6,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: Colors.white),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
