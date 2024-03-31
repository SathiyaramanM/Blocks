import 'package:blocks/models/task.dart';
import 'package:blocks/ui/views/view_task/view_task_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blocks/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ViewTaskViewModel Tests -', () {
    setUp(() => registerServices());

    test('loadTask should be store the task when a proper taskId is provided',
        () {
      final taskService = getAndRegisterTaskService();
      when(taskService.getTask(1))
          .thenReturn(Task(title: 'A', description: 'B', noOfBlocks: 1));
      
      final model = ViewTaskViewModel(1);

      model.loadTask();

      expect(model.task.title, 'A');
      expect(model.task.description, 'B');
      expect(model.task.noOfBlocks, 1);
    });

    setUp(() => registerServices());

    test('loadTask should be throwing an exception the task when a proper taskId is provided',
        () {
      final taskService = getAndRegisterTaskService();
      when(taskService.getTask(1))
          .thenReturn(Task(title: 'A', description: 'B', noOfBlocks: 1));
      
      final model = ViewTaskViewModel(1);
      model.loadTask();

      expect(model.task.title, 'A');
      expect(model.task.description, 'B');
      expect(model.task.noOfBlocks, 1);
    });

    tearDown(() => locator.reset());
  });
}
