import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/provider/todo_provider.dart';

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
      title: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          'افزودن کار جدید',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      content: TextField(
        style: TextStyle(
          fontFamily: 'IranSans',
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
        textAlign: TextAlign.right,
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          hintText: 'یک عنوان انتخاب کنید',
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          )
        ),
        onSubmitted: (_) => addTodo(),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            TextButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(24, 12, 24, 12)),
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade800),
              ),
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text(
                'لغو',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(32, 12, 32, 12)),
                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple[800])
              ),
              onPressed: () => addTodo(), 
              child: Text(
                'افزودن',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            ),
          ],
        )
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