import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/provider/TodoProvider.dart';
import 'package:todo_application/screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoNotifier(),
      child: MaterialApp(
        title: "Todo List App",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        ),
        home: const HomepageScreen(),
      ),
    );
  }
}