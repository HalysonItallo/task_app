import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/core/usecases/usecase.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/repositories/task_repository.dart';
import 'package:task_app/features/task_app/domain/usecases/get_all_tasks/get_all_tasks.dart';

import '../add_task/add_task_test.dart';
//tests for GetAllTasks from get_all_tasks.dart

void main() {
  final tTaskModel = TaskModel(id: 'tarefa1', description: 'descricao aqui');
  

  group("GetAllTasks usecase test: ", () {
    late TaskRepository mockTaskRepository;
    late GetAllTasks getAllTasks;

    setUpAll(() => registerFallbackValue(
      const TaskModel (id: 'tarefa1', description: 'descricao aqui'),
    ));

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      getAllTasks = GetAllTasks(taskRepository: mockTaskRepository);
    });

  });
}