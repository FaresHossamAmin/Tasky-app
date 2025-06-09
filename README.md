# Tasky - Flutter To-Do List App

Tasky is a sleek and intuitive task management app built with Flutter to help you stay organized, motivated, and productive.

## Features

- **Task Organization by Priority:** Easily prioritize tasks and focus on what matters most.  
- **Clear Overview:** Home screen displays pending and completed tasks for quick access.  
- **Dedicated Screens:** Separate To Do and Completed task screens for easy tracking.  
- **User Profile Customization:** Set your username, upload a profile picture, and add a motivational quote to stay inspired.  
- **Dark & Light Theme Support:** Seamlessly switch between light and dark modes based on your preference.  
- **Secure Logout:** Simple logout option to start fresh when needed.  

## Technical Highlights

- **Persistent State Management:** Keeps your tasks and app settings synced and saved across all screens using Provider.  
- **UI Separation:** Uses Provider & Consumer for clean separation between UI and logic, enabling scalable and maintainable code.  
- **Dynamic Theme Handling:** Automatically adapts UI components to match light or dark theme.  
- **Efficient File Storage:** Uses `path_provider` to store user profile images locally on the device.  
- **Smooth User Experience:** Intuitive dialogs and popups (image picker, confirmation alerts) for seamless interactions.  

---

## 🔌 Installation on Physical Device (USB)

To run Tasky directly on your Android device using USB:

1. **Connect Your Phone**
   - Plug your Android phone into your computer using a USB cable.
   - Enable **Developer Options** and **USB Debugging** on your phone.

2. **Build and Install the App**

   In your terminal, navigate to the root of the project and run:

   ```bash
   flutter build apk --release
   flutter install
