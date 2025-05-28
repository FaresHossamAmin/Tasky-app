import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
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
          labelStyle: TextStyle(color: Color.fromRGBO(109, 109, 109, 1)),
          hintStyle: TextStyle(color: Color.fromRGBO(109, 109, 109, 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  width: 42,
                  height: 42,
                ),
                SizedBox(width: 16),
                Text("Tasky", style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            SizedBox(height: 108),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Tasky",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(width: 8),
                SvgPicture.asset(
                  "assets/images/waving-hand.svg",
                  width: 28,
                  height: 28,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Your productivity journey starts here.",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 24),
            SvgPicture.asset(
              "assets/images/pana.svg",
              width: 215,
              height: 204.4,
            ),
            SizedBox(height: 28),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Full Name",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: "e.g Sarah Khalid"),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Let's Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
