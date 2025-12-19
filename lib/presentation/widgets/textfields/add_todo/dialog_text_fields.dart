import 'package:flutter/material.dart';

class AddTodoTextFieldCustom extends StatelessWidget {
  const AddTodoTextFieldCustom({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
      textAlign: TextAlign.right,
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
          borderRadius: BorderRadius.circular(18),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
    );
  }
}
