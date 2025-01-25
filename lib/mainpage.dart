import 'package:flutter/material.dart';
import 'SM_LoginPages.dart';
import 'SM_LoginPages.dart';
// import 'registration.dart'; // Import your registration page here

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.red,
      //   title: const Text('New Screen'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(
                color: Color.fromARGB(255, 203, 244, 54),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to RegistrationTabs page in registration.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
