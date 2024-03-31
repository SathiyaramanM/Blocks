import 'package:blocks/ui/common/ui_helpers.dart';
import 'package:blocks/ui/dialogs/create_task/create_task_dialog.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_task_dialog_model.dart';

@FormView(
    fields: [FormTextField(name: 'title'), FormTextField(name: 'description')])
class CreateTaskDialog extends StackedView<CreateTaskDialogModel>
    with $CreateTaskDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CreateTaskDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateTaskDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => completer(viewModel.closeDialog),
          ),
          title: const Text("Create Task"),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async => completer(await viewModel.createTaskAsync),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: CreateTaskFormValidators.validateTitle,
                    decoration: const InputDecoration(
                        labelText: "Title", hintText: "What's the task?"),
                    controller: titleController,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: "What do you intend to acheive?"),
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    minLines: 1,
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Number of Blocks you need",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                            value: viewModel.noOfBlocks,
                            min: 1,
                            max: 16,
                            onChanged: viewModel.setNoOfBlocks),
                      ),
                      Text("${viewModel.noOfBlocks.toInt()} block(s)")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  CreateTaskDialogModel viewModelBuilder(BuildContext context) =>
      CreateTaskDialogModel();

  @override
  void onViewModelReady(CreateTaskDialogModel viewModel) =>
      syncFormWithViewModel(viewModel);

  @override
  void onDispose(CreateTaskDialogModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}

abstract final class CreateTaskFormValidators {
  static String? validateTitle(String? value) {
    return value == null || value.isEmpty ? "Please enter some value" : null;
  }
}
