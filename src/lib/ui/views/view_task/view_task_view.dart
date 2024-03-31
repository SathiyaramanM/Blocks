import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_task_viewmodel.dart';

class ViewTaskView extends StackedView<ViewTaskViewModel> {
  const ViewTaskView({Key? key, required this.taskId}) : super(key: key);

  final int taskId;

  @override
  Widget builder(
    BuildContext context,
    ViewTaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.task.title),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Description: ${viewModel.task.description}"),
              Text("No. of Blocks: ${viewModel.task.noOfBlocks}")
            ],
          ),
        ),
      ),
    );
  }

  @override
  ViewTaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewTaskViewModel(taskId);
}
