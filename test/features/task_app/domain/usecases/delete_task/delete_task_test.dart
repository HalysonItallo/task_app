import 'package:flutter_test/flutter_test.dart';
import 'package:equatable/equatable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';
import 'package:task_app/features/task_app/domain/usecases/delete_task/delete_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  group ("DeleteTask usecase test: ", () {
    late TaskRepository mockTaskRepository;
    late DeleteTask deleteTask;

    setUpAll(() => registerFallbackValue(
      const TaskModel(
        id: "1",
        description: "Test",
      ),
    ));

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      deleteTask = DeleteTask(taskRepository: mockTaskRepository);
    });

    test("should delete task sucess", () async {
      const tTask = TaskModel(
        id: "1",
        description: "Test",
      );
      


    });
  });
}
