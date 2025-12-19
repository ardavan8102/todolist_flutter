import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/styles/app_theme.dart';
import 'package:tikino/data/model/priority.dart';
import 'package:tikino/data/model/statuses.dart';
import 'package:tikino/data/model/todo.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize DB
  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(TodoPriorityAdapter());
  Hive.registerAdapter(TodoStatsAdapter());
  
  await Hive.openBox<Todo>('todos');
  await Hive.openBox<TodoStats>('stats');

  if (Hive.box<TodoStats>('stats').isEmpty) {
    Hive.box<TodoStats>('stats').put(
      'global',
      TodoStats()
    );
  }

  // hide mobile's navbar menu
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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

        // localization
        locale: const Locale('fa', 'IR'),
        supportedLocales: const [
          Locale('fa', 'IR')
        ],
        localizationsDelegates: const [
          // calender & date picker
          PersianMaterialLocalizations.delegate,
          PersianCupertinoLocalizations.delegate,

          // app
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],

        debugShowCheckedModeBanner: false,

        title: "Tikino",

        theme: AppTheme.mainTheme,

        home: CustomBottomNavigationBar(),
      ),
    );
  }
}