import 'package:blocks/models/task.dart';
import 'package:blocks/objectbox.g.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked_annotations.dart';

class ObjectBoxService implements InitializableDependency {
  late final Store _store;

  late final Box<Task> tasksBox;

  @override
  Future<void> init() async {
    _store = await openStore(
        directory: path.join(
            (await getApplicationDocumentsDirectory()).path, "blocks-app"));
    tasksBox = Box<Task>(_store);
  }
}
