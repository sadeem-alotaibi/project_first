import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF1E2A38), // اللون الأساسي (كحلي داكن)
  scaffoldBackgroundColor: Colors.white, // خلفية جميع الصفحات
  fontFamily: 'Roboto',

  // زر ElevatedButton موحد
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1E2A38), // كحلي
      foregroundColor: Colors.white, // لون النص
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      minimumSize: const Size(double.infinity, 55),
    ),
  ),

  // TextButton موحد
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF1E2A38),
      textStyle: const TextStyle(fontSize: 16),
    ),
  ),

  // InputDecoration موحد لجميع TextFormField
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    hintStyle: const TextStyle(color: Colors.black54),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    prefixIconColor: Colors.black54,
    suffixIconColor: Colors.black54,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  ),
);
