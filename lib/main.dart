import 'package:flutter/material.dart';
import 'package:main_project/Pages/Login.dart';
import 'package:main_project/sqlite/sqlite.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;
  await DatabaseTeam().database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),
    );
  }
}
