import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';
import 'package:tasky/features/navigation/main_screen.dart';
import 'package:tasky/features/task_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSvgPicture.withoutColor(
                        path: 'assets/images/logo.svg',
                        height: 42,
                        width: 42,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Tasky",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 118),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To Tasky ",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      CustomSvgPicture.withoutColor(
                          path: "assets/images/waving_hand.svg"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your productivity journey starts here.",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  CustomSvgPicture.withoutColor(
                    path: 'assets/images/welcome.svg',
                    width: 215,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          controller: controller,
                          hintText: 'e.g. Sarah Khalid',
                          title: "Full Name",
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please Enter Your Full Name ";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 40),
                          ),
                          onPressed: () async {
                            if (_key.currentState?.validate() ?? false) {
                              final username = controller.text.trim();

                              taskController.updateUsername(username);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => MainScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please enter your full name."),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Let's Get Started",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Color(0xFFFFFCFC)),
                          ),
                        ),
                      ],
                    ),
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
