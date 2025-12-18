import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_search_add_button.dart';
import 'package:tikino/presentation/widgets/todo_item.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final todoProvider = Provider.of<Todoprovider>(context);
    
    var size = MediaQuery.of(context).size;
    
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              // Appbar
              AppBarWithSearchBarAndAddButton(),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                  
                      // Tasks List
                      Container(
                        height: size.height * .4,
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: .circular(20),
                          border: Border.all(
                            width: 1,
                            color: AppSolidColors.lightBorder,
                          )
                        ),
                        child: ListView.builder(
                          itemCount: todoProvider.todos.length,
                          itemBuilder: (context, index){
                            final todo = todoProvider.todos[index];
                            return TodoItem(todo: todo, index: index);
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}