import 'package:blocks/entities/task.dart';
import 'package:flutter/material.dart';

class ViewTaskScreen extends StatelessWidget {
  const ViewTaskScreen({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Description: ${task.description ?? "None"}'),
            Text('No. of Blocks: ${task.noOfBlocks}')
          ]),
        ),
      ),
    );
  }
}
