import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/todo_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key, required this.todoProvider});

  final Todoprovider todoProvider;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    return Column(
      children: [
        Text(
          'لیســت کــارهای مــن',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppSolidColors.accent
          ),
        ),

        const SizedBox(height: 16),

        Container(
          height: size.height * .4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: AppSolidColors.lightBorder,
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: todoProvider.undoneTodoList.length,
            itemBuilder: (context, index){
              final todo = todoProvider.undoneTodoList[index];

              return TodoItem(todo: todo);
            }
          ),
        ),

        const SizedBox(height: 40),

        // compeleted tasks
        Text(
          'کارهای انجام شده',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppSolidColors.accent
          ),
        ),

        const SizedBox(height: 16),

        Container(
          height: size.height * .25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: AppSolidColors.lightBorder,
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: todoProvider.doneTodoList.length,
            itemBuilder: (context, index){
              final todo = todoProvider.doneTodoList[index];

              return TodoItem(todo: todo);
            }
          ),
        ),
      ],
    );
  }
}