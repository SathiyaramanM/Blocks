import 'package:blocks/app/app.locator.dart';
import 'package:blocks/models/task.dart';
import 'package:blocks/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewTaskViewModel extends BaseViewModel {
  final _taskService = locator<TaskService>();
  final _navigationService = locator<NavigationService>();

  ViewTaskViewModel(this._taskId) {
    loadTask();
  }

  final int _taskId;

  late Task _task;

  Task get task => _task;

  void loadTask() {
    _task = _taskService.getTask(_taskId);
  }

  void goBack() {
    _navigationService.back();
  }
}
