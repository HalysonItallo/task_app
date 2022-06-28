import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_event.dart';
import 'package:task_app/features/task_app/presentation/bloc/task_bloc/bloc/task_state.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_event.dart';
import 'package:task_app/features/task_app/presentation/widgets/task_item.dart';
import 'package:task_app/features/task_app/presentation/widgets/widgets.dart';
import 'package:task_app/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void dispatchLogout() {
    BlocProvider.of<UserBloc>(context).add(
      const UserEvent.logout(),
    );
  }

  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(
      const TaskEvent.getAllTasks(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  dispatchLogout();
                },
                icon: const Icon(Icons.exit_to_app),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (BuildContext context, TaskState state) {
              return Container(
                child: state.maybeWhen(
                  loading: () => const LoadingWidget(),
                  empty: () {
                    return const Text('Nenhuma atividade no momento');
                  },
                  loaded: (task) {
                    return TaskItem(
                      listTask: task,
                    );
                  },
                  orElse: () {
                    return const Center(
                      child: Text('Nenhuma atividade no momento'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
