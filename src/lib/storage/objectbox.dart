import 'package:blocks/entities/task.dart';
import 'package:blocks/objectbox.g.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store _store;

  late final Box<Task> tasksBox;

  static Future<ObjectBox> create() async {
    final store = await openStore(
        directory: path.join(
            (await getApplicationDocumentsDirectory()).path, "blocks-app"));
    return ObjectBox._create(store);
  }

  ObjectBox._create(this._store) {
    tasksBox = Box<Task>(_store);
  }
}
