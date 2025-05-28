import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                SvgPicture.asset("assets/images/image-Thumbnail.svg"),
                SizedBox(width: 4),
                Text(
                  "New Task",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontFamily: "Poppins"),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Name",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Finish UI design for login screen",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Task Description",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText:
                          "Finish onboarding UI and hand off to devs by Thursday.",
                    ),
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      // to be finished
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AddTaskScreen(),
                      //   ),
                      // );
                    },
                    child: Text(
                      "+ Add Task",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
