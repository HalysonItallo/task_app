import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_app/features/task_app/domain/usecases/add_task/add_task.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';

class MockTaskRepository extends Mock implements TaskRepository {}
void main() {
//tests for AddTask
  group("AddTask usecase test: ", () {
    late TaskRepository mockTaskRepository;
    late AddTask addTask;

    setUpAll(() => registerFallbackValue(
      const TaskModel(
        id: "1",
        description: "Test",
      ),
    ));

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      addTask = AddTask(taskRepository: mockTaskRepository);
    });


  });
}
