import 'package:blocks/entities/task.dart';
import 'package:blocks/screens/create_task_screen.dart';
import 'package:blocks/screens/view_task_screen.dart';
import 'package:blocks/storage/task_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  void createNewTask(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CreateTaskScreen(),
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
              child: Text(
                'Your Tasks',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            StreamBuilder(
              stream: TaskRepository.getTasks(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrintStack(stackTrace: snapshot.stackTrace);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                      itemBuilder: (builder, index) {
                        final task = snapshot.data?[index];
                        if (task == null) {
                          return const Text("Unknown error");
                        }
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) async =>
                              await deleteTask(task.id),
                          child: ListTile(
                              key: Key('list_item_$index'),
                              onTap: () => viewTask(context, task),
                              leading: Checkbox(value: true, onChanged: (_) {}),
                              title: Text(task.title,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async =>
                                      await deleteTask(task.id)),
                              contentPadding: EdgeInsets.zero),
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void viewTask(BuildContext context, Task task) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ViewTaskScreen(task: task)));
  }

  Future deleteTask(int taskId) {
    return TaskRepository.removeTask(taskId);
  }
}
