import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/entities/task_entity.dart';


void main() {
  final tTaskModel = TaskModel(id: 'tarefa1', description: 'descricao aqui');
  group('subclass', () {
    test('should be subclass of task entity', () {
      expect(tTaskModel, isA<TaskEntity>());
    });
  });

}//.fim