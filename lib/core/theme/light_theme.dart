import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primaryContainer: Color(0xFFFFFFFF),
    secondary: Color(0xFF3A4640),
  ),
  scaffoldBackgroundColor: const Color(0xFFF6F7F9),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF6F7F9),
    titleTextStyle: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(0xFF161F1B),
    ),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return const Color(0xFF9E9E9E);
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return const Color(0xFF9E9E9E);
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return 0;
      }
      return 2;
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(const Color(0XFF15B86C)),
      foregroundColor: WidgetStateProperty.all(const Color(0xFFFFFCFC)),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.black),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Color(0xFFFFFCFC),
    extendedTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 24,
      fontFamily: "PlusJakartaSans",
      color: Color(0xFF161F1B),
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontFamily: "PlusJakartaSans",
      color: Color(0xFF161F1B),
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 32,
      fontFamily: "PlusJakartaSans",
      color: Color(0xFF161F1B),
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: Color(0xFF3A4640),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    ),
    titleMedium: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: Color(0xFF6A6A6A),
      fontSize: 14,
      fontFamily: "Poppins",
      decoration: TextDecoration.lineThrough,
      decorationColor: Color(0xFF6A6A6A),
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF161F1B),
      fontSize: 20,
      fontFamily: "Poppins",
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      fontFamily: "Poppins",
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
    filled: true,
    fillColor: const Color(0xFFFFFFFF),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 0.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFD1DAD6),
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFD1DAD6),
        width: 0.5,
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      color: Color(0xFF6E6E6E),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF161F1B),
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Color(0xFF161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  dividerTheme: const DividerThemeData(color: Color(0xFF9E9E9E)),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.black12,
    selectionHandleColor: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF6F7F9),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Color(0xFF6E6E6E),
    selectedItemColor: Color(0xFF0F9D58),
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 2.5,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 2.5,
    ),
  ),
  splashFactory: NoSplash.splashFactory,
  popupMenuTheme: PopupMenuThemeData(
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Color(0xFF15B86C), width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 2,
    shadowColor: const Color(0xFF15B86C),
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
);
