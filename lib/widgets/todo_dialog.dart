import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PurpleDo/provider/TodoProvider.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('افزودن کار جدید'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'یک عنوان انتخاب کنید',
        ),
        onSubmitted: (_) => addTodo(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: Text('لغو'),
        ),

        ElevatedButton(
          onPressed: () => addTodo(), 
          child: Text('افزودن')
        ),
      ],
    );
  }

  void addTodo() {
    final title = _controller.text.trim();
    if (title.isNotEmpty) {
      Provider.of<Todoprovider>(context, listen: false).addTodo(title);
      Navigator.pop(context);
    }
  }
}