import 'package:flutter/material.dart';

import 'SM_AcademicDetailsPage.dart';
import 'SM_Sem result Upload.dart';
import 'SM_Verify Contact Information.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileCompletionPage(),
  ));
}

class ProfileCompletionPage extends StatelessWidget {
  const ProfileCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double profileCompletion = 0.7; // Example: 70% profile completion

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Completion'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(profileCompletion),

              const SizedBox(height: 16),

              // Task List Section
              _buildSectionTitle('Steps to Complete Your Profile'),
              const SizedBox(height: 8),
              _buildTaskItem(context, 'Upload Profile Picture', true, null),
              _buildTaskItem(context, 'Fill Personal Information', true, null),
              _buildTaskItem(
                context,
                'Add Academic Details',
                false,
                const AcademicDetailsCompletionPage(),
              ),
              _buildTaskItem(
                context,
                'UpdatePasswordPage',
                false,
                const UpdatePasswordPage(),
              ),
              _buildTaskItem(
                context,
                'Upload Required Documents',
                false,
                const UploadPDFPage(),
              ),

              const SizedBox(height: 16),

              // Profile Details (Optional Overview)
              _buildSectionTitle('Profile Overview'),
              _buildProfileOverview(),

              const SizedBox(height: 20),

              // Save Button
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double profileCompletion) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Your Profile Completion',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: profileCompletion,
                  color: Colors.blueAccent,
                  backgroundColor: Colors.grey[300],
                  strokeWidth: 10,
                ),
              ),
              Text(
                '${(profileCompletion * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Complete the remaining steps to achieve 100%',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _buildTaskItem(
    BuildContext context,
    String task,
    bool isCompleted,
    Widget? targetPage,
  ) {
    return ListTile(
      leading: Icon(
        isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(
        task,
        style: TextStyle(
          fontSize: 16,
          color: isCompleted ? Colors.grey : Colors.black,
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: isCompleted
          ? null
          : ElevatedButton(
              onPressed: () {
                if (targetPage != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => targetPage),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Complete'),
            ),
    );
  }

  Widget _buildProfileOverview() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildOverviewRow('Name', 'Vishnu'),
          _buildOverviewRow('Roll No', '12345'),
          _buildOverviewRow('Class', 'BSc CS'),
          _buildOverviewRow('Contact', 'vishnu@example.com'),
          _buildOverviewRow('Documents Uploaded', '3/5'),
        ],
      ),
    );
  }

  Widget _buildOverviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // New widget to create Save button at the bottom
  Widget _buildActionButtons(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle save action
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile Saved!')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: const Text(
        "Save",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class AcademicDetailsPage extends StatelessWidget {
  const AcademicDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Academic Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: const Text(
          'Academic Details Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Contact Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: const Text(
          'Contact Verification Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }


class DocumentUploadPage extends StatelessWidget {
  const DocumentUploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Documents'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: const Text(
          'Document Upload Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
