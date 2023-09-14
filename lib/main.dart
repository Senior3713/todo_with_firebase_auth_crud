import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:todo_with_firebase_auth/app.dart';
import 'package:todo_with_firebase_auth/services/firebase_options.dart';
import 'package:todo_with_firebase_auth/services/sql_service.dart';

final sql =  SqlService();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final databasePath = await getDatabasesPath();
  final path = join(databasePath, "TodoApp.db");

  await sql.open(path);

  runApp(const TodoWithFirebase());
}
