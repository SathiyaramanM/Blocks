import 'package:blocks/app/app.locator.dart';
import 'package:blocks/models/task.dart';
import 'package:blocks/objectbox.g.dart';
import 'package:blocks/services/object_box_service.dart';

class TaskService {
  final _objectBox = locator<ObjectBoxService>();

  Future<int> addTask(Task task) => _objectBox.tasksBox.putAsync(task);

  Future<void> removeTask(int taskId) =>
      _objectBox.tasksBox.removeAsync(taskId);

  Stream<List<Task>> getTasks() {
    final builder =
        _objectBox.tasksBox.query().order(Task_.title, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Task getTask(int taskId) {
    final result = _objectBox.tasksBox.get(taskId);
    if (result == null) {
      throw Exception("Task Not Found");
    }
    return result;
  }
}
