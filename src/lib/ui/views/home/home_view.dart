import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocks'),
        actions: [
          IconButton(
              onPressed: viewModel.isBusy ? null : viewModel.loadAllTasks,
              icon: const Icon(Icons.refresh)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.createNewTask,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: viewModel.isBusy
            ? const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        stream: viewModel.tasks,
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
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              ],
                            );
                          } else {
                            return Expanded(
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const ScrollPhysics(),
                                    itemCount: snapshot.hasData
                                        ? snapshot.data!.length
                                        : 0,
                                    itemBuilder: (builder, index) {
                                      final task = snapshot.data?[index];
                                      if (task == null) {
                                        return const Text("Unknown error");
                                      }
                                      return Dismissible(
                                        key: UniqueKey(),
                                        onDismissed: (direction) =>
                                            viewModel.deleteTask(task.id),
                                        child: ListTile(
                                            key: Key('list_item_$index'),
                                            onTap: () =>
                                                viewModel.viewTask(task.id),
                                            leading: Checkbox(
                                                value: true, onChanged: (_) {}),
                                            title: Text(task.title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge),
                                            trailing: IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () => viewModel
                                                    .deleteTask(task.id)),
                                            contentPadding: EdgeInsets.zero),
                                      );
                                    }),
                              ),
                            );
                          }
                        })
                  ],
                ),
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
