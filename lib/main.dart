import 'package:flutter/material.dart';

import 'SM_welcome page.dart';
import 'SM_loginPages.dart';
import 'SM_attendance_screen.dart';
import 'SM_homepage.dart';
import 'SM_profile_page.dart';
import 'registration.dart';
import 'SM_classteacherhome.dart';
import 'SM_welcome page.dart'; 
import 'Class Test Result Page.dart';
// Import WelcomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SynChronis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define light and dark themes
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system, // Add system theme switching
      home: const WelcomePage(), // Ensure WelcomePage is implemented correctly
    );
  }
}
