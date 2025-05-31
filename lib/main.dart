import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/models/task_model.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/main_screen.dart';
import 'package:tasky/welcome_screen.dart';

extension NullableStringValidators on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesManager().init();
  String? username = PreferencesManager().getString(StorageKey.username);

  runApp(MyApp(username: username));
}

class MyApp extends StatelessWidget {
  final String? username;
  const MyApp({super.key, required this.username});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Color.fromRGBO(21, 184, 108, 1);
            }
            return Color.fromRGBO(255, 252, 252, 1);
          }),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Color.fromRGBO(255, 252, 252, 1);
            }
            return Color.fromRGBO(158, 158, 158, 1);
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            return Color.fromRGBO(158, 158, 158, 1);
          }),

          trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return 0;
            }
            return 2;
          }),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 40),
            backgroundColor: Color.fromRGBO(21, 184, 108, 1),
            foregroundColor: Color.fromRGBO(255, 252, 252, 1),
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
          ),
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 24,
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          displayLarge: TextStyle(
            fontSize: 28,
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(40, 40, 40, 1),
          hintStyle: TextStyle(color: Color.fromRGBO(109, 109, 109, 1)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(21, 184, 108, 1),
          extendedIconLabelSpacing: 8,
          extendedPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          extendedTextStyle: TextStyle(
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          unselectedItemColor: Color.fromRGBO(198, 198, 198, 1),
          selectedItemColor: Color.fromRGBO(21, 184, 108, 1),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(21, 184, 108, 1),
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(198, 198, 198, 1),
            fontSize: 12,
          ),
        ),
      ),
      home: username.isNullOrEmpty ? WelcomeScreen() : MainScreen(),
    );
  }
}
