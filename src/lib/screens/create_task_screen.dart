import 'package:blocks/entities/task.dart';
import 'package:blocks/storage/task_repository.dart';
import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  double _noOfBlocks = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Task'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => {Navigator.of(context).pop()},
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final title = _titleController.text;
                    final description = _descriptionController.text;
                    final noOfBlocks = _noOfBlocks.toInt();
                    final task = Task(
                        title: title,
                        description: description,
                        noOfBlocks: noOfBlocks);
                    await TaskRepository.addTask(task);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
                icon: const Icon(Icons.check))
          ],
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? "Please enter some value"
                          : null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Title", hintText: "What's the task?"),
                    controller: _titleController,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: "Describe your task in few words"),
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    minLines: 1,
                    controller: _descriptionController,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text("Number of Blocks you need",
                        style: TextStyle(
                            color: Theme.of(context).hintColor, fontSize: 16)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: _noOfBlocks,
                          min: 1,
                          max: 16,
                          onChanged: (value) {
                            setState(() {
                              _noOfBlocks = value;
                            });
                          },
                        ),
                      ),
                      Text("${_noOfBlocks.toInt()} block(s)")
                    ],
                  ),
                ],
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }
}
