import 'package:blocks/app/app.locator.dart';
import 'package:blocks/models/task.dart';
import 'package:blocks/services/task_service.dart';
import 'package:blocks/ui/dialogs/create_task/create_task_dialog.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateTaskDialogModel extends FormViewModel {
  final dialogService = locator<DialogService>();
  final taskService = locator<TaskService>();

  final formKey = GlobalKey<FormState>();

  double _noOfBlocks = 1;

  double get noOfBlocks => _noOfBlocks;

  void setNoOfBlocks(double value) {
    _noOfBlocks = value;
    notifyListeners();
  }

  DialogResponse get closeDialog => DialogResponse(confirmed: false);

  Future<DialogResponse> get createTaskAsync async {
    await taskService.addTask(Task(
        title: titleValue ?? 'Title',
        description: descriptionValue,
        noOfBlocks: noOfBlocks.toInt()));
    return DialogResponse(confirmed: true);
  }
}
