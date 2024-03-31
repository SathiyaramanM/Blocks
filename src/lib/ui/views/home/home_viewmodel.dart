import 'package:blocks/app/app.dialogs.dart';
import 'package:blocks/app/app.locator.dart';
import 'package:blocks/app/app.router.dart';
import 'package:blocks/models/task.dart';
import 'package:blocks/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _taskService = locator<TaskService>();
  final _dialogService = locator<DialogService>();

  HomeViewModel() {
    loadAllTasks();
  }

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  late Stream<List<Task>> _tasks;
  Stream<List<Task>> get tasks => _tasks;

  Future<void> loadAllTasks() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    _tasks = _taskService.getTasks();
    setBusy(false);
    rebuildUi();
  }

  void createNewTask() {
    _dialogService.showCustomDialog(variant: DialogType.createTask);
  }

  void viewTask(int taskId) {
    _navigationService.navigateToViewTaskView(taskId: taskId);
  }

  Future<void> deleteTask(int taskId) async {
    final response = await _dialogService.showConfirmationDialog(
        title: 'Delete Task?',
        description:
            'Are you sure want to delete this Task? This action cannot be undone.',
        confirmationTitle: 'Delete',
        cancelTitle: 'Cancel',
        cancelTitleColor: Colors.blueGrey.shade500);
    if (response?.confirmed == true) {
      _taskService.removeTask(taskId);
    } else {
      loadAllTasks();
    }
  }
}
