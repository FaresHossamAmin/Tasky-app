import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/models/task_model.dart';

class TaskController with ChangeNotifier {
  String? username = "Default";
  String? motivationQuote = "Default";
  String? userImagePath;
  List<TaskModel> allTasks = [];

  // to be included in other screens -> convert each screen to be stateless
  // each list that will change -> should also change the allTasks list
  List<TaskModel> get uncompletedTasks =>
      allTasks.where((task) => !task.isDone).toList();

  List<TaskModel> get completedTasks =>
      allTasks.where((task) => task.isDone).toList();

  List<TaskModel> get highPriorityTasks =>
      allTasks.where((task) => task.isHighPriority).toList();

  bool isLoading = false;
  int totalTask = 0;
  int totalDoneTasks = 0;
  double percent = 0;

  init() {
    isLoading = true;
    notifyListeners();

    loadUserData();
    loadAllTasks();

    isLoading = false;
    notifyListeners();
  }

  void loadUserData() {
    isLoading = true;

    username =
        PreferencesManager().getString(StorageKey.username) ?? "Username";
    userImagePath = PreferencesManager().getString(StorageKey.userImage);
    motivationQuote =
        PreferencesManager().getString(StorageKey.motivationQuote) ??
            "One task at a time. One step closer.";
    isLoading = false;

    notifyListeners();
  }

  void loadAllTasks() {
    isLoading = true;

    final finalTask = PreferencesManager().getString(StorageKey.tasks);
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;

      allTasks = taskAfterDecode
          .map((element) => TaskModel.fromJson(element))
          .toList();
      calculatePercent();
    }

    isLoading = false;

    notifyListeners();
  }

  updateUsername(String newUsername) async {
    username = newUsername;
    await PreferencesManager().setString(StorageKey.username, newUsername);
    notifyListeners();
  }

  updateMotivationQuote(String newQuote) async {
    motivationQuote = newQuote;
    await PreferencesManager()
        .setString(StorageKey.motivationQuote, motivationQuote ?? "");
    notifyListeners();
  }

  clearUserData() async {
    await PreferencesManager().remove(StorageKey.username);
    await PreferencesManager().remove(StorageKey.motivationQuote);
    await PreferencesManager().remove(StorageKey.tasks);
    await PreferencesManager().remove(StorageKey.userImage);
    totalTask = 0;
    totalDoneTasks = 0;
    percent = 0;
    userImagePath = null;
    motivationQuote = "One task at a time. One step closer.";

    allTasks.clear();

    notifyListeners();
  }

  calculatePercent() {
    totalTask = allTasks.length;
    totalDoneTasks = allTasks.where((e) => e.isDone).length;
    percent = totalTask == 0 ? 0 : totalDoneTasks / totalTask;
  }

  void doneTask(bool? value, int? id) async {
    if (id == null) return;

    final index = allTasks.indexWhere((task) => task.id == id);
    if (index == -1) return;

    allTasks[index].isDone = value ?? false;
    calculatePercent();

    final updatedTask = allTasks.map((element) => element.toJson()).toList();
    PreferencesManager().setString(StorageKey.tasks, jsonEncode(updatedTask));

    notifyListeners();
  }

  deleteTask(int? id) async {
    if (id == null) return;
    allTasks.removeWhere((task) => task.id == id);
    calculatePercent();
    final updatedTask = allTasks.map((element) => element.toJson()).toList();
    PreferencesManager().setString(StorageKey.tasks, jsonEncode(updatedTask));

    notifyListeners();
  }
}
