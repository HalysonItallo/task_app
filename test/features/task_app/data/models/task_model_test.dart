import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/domain/entities/task_entity.dart';

import '../../../../fixtures/task.json';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTaskModel = TaskModel(id: 'tarefa1', description: 'descricao aqui');
  group('subclass', () {
    test('should be subclass of task entity', () {
      expect(tTaskModel, isA<TaskEntity>());
    });
  });

  group('json tests', () async {
    test('should be json', () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('task.json'));

      final result = TaskModel.fromJson(jsonMap);

      expect(result, tTaskModel);
    });

    test('should be return a map from json inserted', () async {
      final result = tTaskModel.toJson();
      final mapGenerated = {
        
        "text": "Test Text",
        "number": 1,
        "found": true,
        "type": "task"

      };
      expect(result, mapGenerated);
    });
  });
}//.fim