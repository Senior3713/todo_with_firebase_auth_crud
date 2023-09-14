import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_auth/blocs/auth/auth_bloc.dart';
import 'package:todo_with_firebase_auth/blocs/todo/todo_bloc.dart';
import 'package:todo_with_firebase_auth/pages/registration/sign_in_page.dart';
import 'package:todo_with_firebase_auth/pages/registration/sign_up_page.dart';

class TodoWithFirebase extends StatelessWidget {
  const TodoWithFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(create: (context) => TodoBloc(),),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        home: SignUpPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
