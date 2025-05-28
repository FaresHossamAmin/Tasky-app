import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/addTask_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/happy-svgrepo-com.svg",
                  width: 42,
                  height: 42,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Evening, Fares",
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontFamily: "Poppins"),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "One task at a time. One step\ncloser.",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        color: Color.fromRGBO(198, 198, 198, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Yuhuu, Your work Is",
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(fontSize: 32),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "almost done !",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontSize: 32),
                ),
                SizedBox(width: 8),
                SvgPicture.asset(
                  "assets/images/waving-hand.svg",
                  width: 42,
                  height: 42,
                ),
              ],
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
              child: Text("Add New Task"),
            ),
          ],
        ),
      ),
    );
  }
}
