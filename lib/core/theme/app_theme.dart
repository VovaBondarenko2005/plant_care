
import 'package:flutter/material.dart';

class AppTheme {
 static const Color primary = Color(0xFF367D52);
 static const Color background = Color(0xFFF6F8F2);
 static const Color lightGreen = Color(0xFFE5F1E7);
 static const Color text = Color(0xFF26362B);

 static ThemeData get lightTheme {
  return ThemeData(
   useMaterial3: true,
   scaffoldBackgroundColor: background,
   colorScheme: ColorScheme.fromSeed(
    seedColor: primary,
    primary: primary,
    surface: background,
   ),
   appBarTheme: const AppBarTheme(
    backgroundColor: background,
    foregroundColor: text,
    centerTitle: false,
    elevation: 0,
   ),
   inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(
     horizontal: 16,
     vertical: 16,
    ),
    border: OutlineInputBorder(
     borderRadius: BorderRadius.circular(14),
    ),
    enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(14),
     borderSide: const BorderSide(
      color: Color(0xFFDCE5DD),
     ),
    ),
    focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(14),
     borderSide: const BorderSide(
      color: primary,
      width: 2,
     ),
    ),
   ),
   elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
     backgroundColor: primary,
     foregroundColor: Colors.white,
     minimumSize: const Size(double.infinity, 52),
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
     ),
    ),
   ),
  );
 }
}
