import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_with_firebase_auth/blocs/todo/todo_bloc.dart';
import 'package:todo_with_firebase_auth/models/todo_item.dart';

class EditTodoPage extends StatefulWidget {
  final TodoItem todo;

  const EditTodoPage({super.key, required this.todo});

  @override
  State<EditTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<EditTodoPage> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  @override
  void initState() {
    titleCtrl.text = widget.todo.title;
    descCtrl.text = widget.todo.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Todo",
          style: GoogleFonts.hennyPenny(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Title",
                  style: GoogleFonts.underdog(
                    color: Colors.white54,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: titleCtrl,
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                  hintText: "Title",
                  contentPadding: const EdgeInsets.all(15),
                  hintStyle: GoogleFonts.aleo(color: Colors.white60),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  fillColor: Colors.brown,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: GoogleFonts.underdog(
                    color: Colors.white54,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                controller: descCtrl,
                decoration: InputDecoration(
                  hintText: "Description",
                  contentPadding: const EdgeInsets.all(15),
                  hintStyle: GoogleFonts.aleo(color: Colors.white60),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  fillColor: Colors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25),
        child: FloatingActionButton(
          backgroundColor: Colors.brown,
          onPressed: () {
            if (titleCtrl.text.isEmpty || descCtrl.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Something error, Please try again!!!"),
                ),
              );
              return;
            }

            BlocProvider.of<TodoBloc>(context).add(
              EditTodo(
                title: titleCtrl.text,
                desc: descCtrl.text,
                todoItem: widget.todo,
              ),
            );

            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.checkmark_alt,
            size: 30,
          ),
        ),
      ),
    );
  }
}
