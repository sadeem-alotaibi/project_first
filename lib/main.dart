import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:projact_first/features/auth/view/login_view.dart'; // Import LoginView page

// === Unified theme for the entire app ===
final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF1E2A38), // Primary color (dark navy)
  scaffoldBackgroundColor: Colors.white, // Default background for all pages
  fontFamily: 'Roboto', // Default font family

  // Unified ElevatedButton style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1E2A38), // Button background color
      foregroundColor: Colors.white, // Button text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      elevation: 4, // Shadow
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      minimumSize: const Size(double.infinity, 55), // Button size
    ),
  ),

  // Unified TextButton style
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF1E2A38), // Text color
      textStyle: const TextStyle(fontSize: 16), // Font size
    ),
  ),

  // Unified InputDecoration for all TextFormFields
  inputDecorationTheme: InputDecorationTheme(
    filled: true, // Fill background
    fillColor: Colors.grey.shade100, // Background color
    hintStyle: const TextStyle(color: Colors.black54), // Hint text color
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16), // Rounded borders
      borderSide: BorderSide.none, // No border line
    ),
    prefixIconColor: Colors.black54, // Prefix icon color
    suffixIconColor: Colors.black54, // Suffix icon color
    contentPadding:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding
  ),
);

void main() {
  runApp(const MyApp()); // Run the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asterisk Store', // App title
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: appTheme, // Apply unified theme
      home: const LoginView(), // First screen of the app
    );
  }
}
