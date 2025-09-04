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
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            'لیست کارهای روزانه',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {}, 
          icon: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12)
            ),
            child: Icon(
              Icons.question_mark_outlined,
              color: Colors.black,
            ),
          )
        ),
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'افزودن',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showDialog(context: context, builder: (_) => AddTodoDialog());
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}