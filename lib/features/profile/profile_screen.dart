import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/core/theme/theme_controller.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';
import 'package:tasky/features/profile/user_details_screen.dart';
import 'package:tasky/features/task_controller.dart';
import 'package:tasky/features/welcome/welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);

    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'My Profile',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: controller.userImagePath == null
                          ? const AssetImage('assets/images/person.png')
                              as ImageProvider
                          : FileImage(File(controller.userImagePath!)),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),
                    GestureDetector(
                      onTap: () async {
                        showImageSourceDialog(context, (XFile file) async {
                          final path = await _saveImage(file);
                          await PreferencesManager()
                              .setString(StorageKey.userImage, path);
                          controller.loadUserData();
                        });
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: const Icon(Icons.camera_alt, size: 26),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  controller.username ?? '',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  controller.motivationQuote ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Profile Info',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 24),
          ListTile(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UserDetailsScreen(
                    userName: controller.username ?? '',
                    motivationQuote: controller.motivationQuote ?? '',
                  ),
                ),
              );
              if (result != null && result) {
                controller.loadUserData();
              }
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              'User Details',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            leading: const CustomSvgPicture(
              path: 'assets/images/profile_icon.svg',
            ),
            trailing: const CustomSvgPicture(
              path: 'assets/images/arrow_right.svg',
            ),
          ),
          const Divider(thickness: 1),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            leading:
                const CustomSvgPicture(path: 'assets/images/dark_icon.svg'),
            trailing: ValueListenableBuilder(
              valueListenable: ThemeController.themeNotifier,
              builder: (_, value, __) {
                return Switch(
                  value: value == ThemeMode.dark,
                  onChanged: (_) => ThemeController.toggleTheme(),
                );
              },
            ),
          ),
          const Divider(thickness: 1),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirm Logout'),
                  content: Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Cancel
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context); // Close the dialog
                        await controller.clearUserData();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => WelcomeScreen()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Log Out',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              );
            },
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Log Out',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            leading:
                const CustomSvgPicture(path: 'assets/images/logout_icon.svg'),
            trailing:
                const CustomSvgPicture(path: 'assets/images/arrow_right.svg'),
          ),
        ],
      ),
    );
  }

  static Future<String> _saveImage(XFile file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final savedPath = '${appDir.path}/${file.name}';
    final newFile = await File(file.path).copy(savedPath);
    return newFile.path;
  }
}

void showImageSourceDialog(BuildContext context, Function(XFile) selectedFile) {
  showDialog(
    context: context,
    builder: (_) {
      return SimpleDialog(
        title: Text(
          'Choose Image Source',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          SimpleDialogOption(
            onPressed: () async {
              Navigator.pop(context);
              final image =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (image != null) selectedFile(image);
            },
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.camera_alt),
                SizedBox(width: 8),
                Text('Camera'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () async {
              Navigator.pop(context);
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) selectedFile(image);
            },
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.photo_library),
                SizedBox(width: 8),
                Text('Gallery'),
              ],
            ),
          ),
        ],
      );
    },
  );
}
