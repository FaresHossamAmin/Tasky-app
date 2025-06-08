import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primaryContainer: Color(0xFF282828),
    secondary: Color(0XFFC6C6C6),
  ),
  scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF181818),
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFCFC),
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(0xFFFFFCFC),
    ),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFF15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return Color(0xFF9E9E9E);
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
      backgroundColor: WidgetStateProperty.all(Color(0XFF15B86C)),
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFCFC)),
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
    foregroundColor: WidgetStateProperty.all(Color(0xFFFFFCFC)),
  )),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Color(0xFFFFFCFC),
    extendedTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: TextTheme(
    displaySmall: TextStyle(
      fontSize: 24,
      fontFamily: "PlusJakartaSans",
      color: Color(0xFFFFFCFC),
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontFamily: "PlusJakartaSans",
      fontSize: 32,
      color: Color(0xFFFFFCFC),
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: Color(0xFFA0A0A0),
      fontFamily: "Poppins",
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: Color(0xFFFFFCFC),
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    // For Done Task
    titleLarge: TextStyle(
      color: Color(0xFFA0A0A0),
      fontSize: 14,
      fontFamily: "Poppins",
      decoration: TextDecoration.lineThrough,
      decorationColor: Color(0xFFA0A0A0),
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xFFFFFCFC),
        fontSize: 20,
        fontFamily: "Poppins"),
    labelMedium:
        TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Poppins"),
    labelLarge:
        TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Poppins"),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xFF6D6D6D),
    ),
    filled: true,
    fillColor: Color(0xFF282828),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.red,
        width: 0.5,
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(
      color: Color(0xFF6E6E6E),
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFFFFFCFC),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFCFC),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  dividerTheme: DividerThemeData(color: Color(0xFF6E6E6E)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.black,
    selectionHandleColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF181818),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Color.fromARGB(255, 129, 129, 129),
    selectedItemColor: Color.fromARGB(255, 20, 190, 108),
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
    color: Color(0xFF181818),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFF15B86C), width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 2,
    shadowColor: Color(0xFF15B86C),
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
);
