import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_with_firebase_auth/blocs/todo/todo_bloc.dart';
import 'package:todo_with_firebase_auth/pages/registration/sign_in_page.dart';
import 'package:todo_with_firebase_auth/pages/todo/create_page.dart';
import 'package:todo_with_firebase_auth/pages/todo/edit_page.dart';
import 'package:todo_with_firebase_auth/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetAllTodos());
  }

  @override
  Widget build(BuildContext context) {
    final todo = context.watch<TodoBloc>().state.todo;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(
          'All Todos',
          style: GoogleFonts.hennyPenny(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    content: const Text("Are you sure to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AuthService.logOut();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (builder) => const SignInPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: todo.todos.isEmpty
            ? Opacity(
                opacity: .8,
                child: Lottie.asset(
                  'assets/lotties/not_found.json',
                  reverse: true,
                  repeat: true,
                  width: 270,
                ))
            : ListView.builder(
                itemCount: todo.todos.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  final item = todo.todos[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      onLongPress: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => EditTodoPage(
                            todo: todo.todos[index],
                          ),
                        ),
                      ),
                      leading: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "${index + 1}",
                          style: GoogleFonts.shadowsIntoLightTwo(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      title: Text(
                        item.title,
                        maxLines: 1,
                        style: GoogleFonts.shareTechMono(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        item.desc,
                        maxLines: 2,
                        style: GoogleFonts.zenKakuGothicAntique(
                          color: Colors.white70,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                content: const Text(
                                    "Are you sure to delete this todo?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      BlocProvider.of<TodoBloc>(context).add(
                                        RemoveTodo(todoItem: todo.todos[index]),
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => const CreateTodoPage(),
            ),
          ),
          backgroundColor: Colors.brown,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
