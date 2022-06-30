import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:task_app/features/task_app/presentation/bloc/user_bloc/user_event.dart';
import 'package:task_app/features/task_app/presentation/pages/registerPage/register_page.dart';

class LoginPage extends StatefulWidget {
  final String snackBarMenssage;
  const LoginPage({
    Key? key,
    required this.snackBarMenssage,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void dispatchLogin() {
      BlocProvider.of<UserBloc>(context).add(
        UserEvent.login(
          emailController.text,
          passwordController.text,
        ),
      );
    }

    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // color: Color.fromARGB(255, 172, 207, 239),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 186, 156, 255),
              Color.fromARGB(255, 51, 81, 186),
            ],
          ),
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
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Task App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  icon: Icon(Icons.email),
                  ),
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      dispatchLogin();
                      if (widget.snackBarMenssage != '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              widget.snackBarMenssage,
                            ),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    child: const Text("Entrar"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    child: const Text("Cadastre-se"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
