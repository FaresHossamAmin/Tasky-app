import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/components/custom_text_form_field.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/main.dart';

/*
 * This screen is shown only if first time user launches app
 */
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> enterNameKeyValidator = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: enterNameKeyValidator,
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
                      Text(
                        "Tasky",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
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
                  CustomTextFormField(
                    title: "Full Name",
                    hintText: "e.g. Sarah Khalid",
                    controller: controller,
                    validator: (value) {
                      if (value.isNullOrEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (enterNameKeyValidator.currentState?.validate() ??
                          false) {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();

                        await sharedPreferences.setString(
                          'username',
                          controller.text,
                        );
                        print('Saved username: ${controller.text}');
                        Navigator.pushReplacement(
                        // Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },

                    child: Text("Let's Get Started"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
