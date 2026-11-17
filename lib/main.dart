import 'package:flutter/material.dart';

import 'screens/weight_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitTrack Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A6B5D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F6F4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4A6B5D),
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 12),
        ),
      ),
      home: const WeightScreen(),
    );
  }
}
