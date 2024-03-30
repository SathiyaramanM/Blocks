import 'package:blocks/entities/task.dart';
import 'package:blocks/main.dart';
import 'package:blocks/objectbox.g.dart';

class TaskRepository {
  static Stream<List<Task>> getTasks() {
    final builder =
        objectBox.tasksBox.query().order(Task_.title, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  static Future<int> addTask(Task task) => objectBox.tasksBox.putAsync(task);

  static Future<void> removeTask(int taskId) => 
      objectBox.tasksBox.removeAsync(taskId);
}
