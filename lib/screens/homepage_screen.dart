import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PurpleDo/provider/TodoProvider.dart';
import 'package:PurpleDo/widgets/todo_dialog.dart';
import 'package:PurpleDo/widgets/todo_item.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<Todoprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست کارهای روزانه'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: todoProvider.todos.length,
          itemBuilder: (context, index){
            final todo = todoProvider.todos[index];
            return TodoItem(todo: todo, index: index);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => AddTodoDialog());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}