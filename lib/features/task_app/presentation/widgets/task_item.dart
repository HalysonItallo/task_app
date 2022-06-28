import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_event.dart';

class TaskItem extends StatefulWidget {
  final List<TaskModel> listTask;
  const TaskItem({Key? key, required this.listTask}) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  dispatchDeleteTask(String id) {
    BlocProvider.of<TaskBloc>(context).add(
      TaskEvent.deleteTask(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listTask.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.listTask[index].description),
                IconButton(
                  onPressed: () {
                    dispatchDeleteTask(widget.listTask[index].id!);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      shrinkWrap: true,
    );
  }
}
