// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/create_task/create_task_dialog.dart';

enum DialogType {
  createTask,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.createTask: (context, request, completer) =>
        CreateTaskDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
