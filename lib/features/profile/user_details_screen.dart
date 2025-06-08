import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';
import 'package:tasky/features/task_controller.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    super.key,
    required this.userName,
    required this.motivationQuote,
  });

  final String userName;
  final String? motivationQuote;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late final TextEditingController userNameController;
  late final TextEditingController motivationQuoteController;
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController(text: widget.userName);
    motivationQuoteController =
        TextEditingController(text: widget.motivationQuote);
  }

  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'User Details',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: userNameController,
                hintText: 'Usama Elgendy',
                title: "User Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter User Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: motivationQuoteController,
                hintText: 'One task at a time. One step closer.',
                title: "Motivation Quote",
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Motivation Quote";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      final newUsername = userNameController.text.trim();
                      final newQuote = motivationQuoteController.text.trim();

                      taskController.updateUsername(newUsername);
                      taskController.updateMotivationQuote(newQuote);
                      await Future.delayed(Duration(milliseconds: 250));

                      Navigator.pop(context, true);
                    }
                  },
                  child: Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
