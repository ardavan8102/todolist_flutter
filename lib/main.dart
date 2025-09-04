import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:PurpleDo/model/todo.dart';
import 'package:PurpleDo/provider/TodoProvider.dart';
import 'package:PurpleDo/screens/homepage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize DB
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');

  // Run
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Todoprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Purple Do",
        theme: ThemeData(
          fontFamily: "IranSans",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        ),
        home: const HomepageScreen(),
      ),
    );
  }
}