import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_event.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController descriptionController = TextEditingController();

  dispatchAddTask(TaskModel task) {
    BlocProvider.of<TaskBloc>(context).add(
      TaskEvent.addTask(task),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(89, 101, 111, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: "Descrição da atividade"),
                ),
                ElevatedButton(
                  onPressed: () {
                    dispatchAddTask(
                      TaskModel(description: descriptionController.text),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: const Text("Adicionar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
