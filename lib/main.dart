import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyFishingApp());
}

class MyFishingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fishing App',
      theme: ThemeData(
        primaryColor: Color(0xFF40D3C4),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF36AFAB),
        ),
        scaffoldBackgroundColor: Color(0xFFF4F4F9),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontFamily: 'BRCandor', color: Color(0xFF353243)),
          titleLarge: TextStyle(fontFamily: 'BRCandor', color: Color(0xFF353243)),
          bodyMedium: TextStyle(fontFamily: 'BRCandor', color: Color(0xFF353243)),
        ),
        iconTheme: IconThemeData(color: Color(0xFF4F677C)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF40D3C4),
          unselectedItemColor: Color(0xFF4F677C),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
