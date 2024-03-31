import 'package:blocks/ui/views/home/home_view.dart';
import 'package:blocks/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:blocks/ui/dialogs/create_task/create_task_dialog.dart';
import 'package:blocks/ui/bottom_sheets/sample/sample_sheet.dart';
import 'package:blocks/services/object_box_service.dart';
import 'package:blocks/services/task_service.dart';
import 'package:blocks/ui/views/view_task/view_task_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ViewTaskView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    InitializableSingleton(classType: ObjectBoxService),
    LazySingleton(classType: TaskService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: SampleSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: CreateTaskDialog),
// @stacked-dialog
  ],
)
class App {}
