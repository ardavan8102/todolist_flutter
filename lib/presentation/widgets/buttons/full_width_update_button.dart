import 'package:flutter/material.dart';

class FullWidthUpdateCategoryElevatedButton extends StatelessWidget {
  const FullWidthUpdateCategoryElevatedButton({
    super.key,
    required this.selectedColor,
    required this.function
  });

  final Color selectedColor;
  final Function() function;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(selectedColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ))
        ),
        child: Text(
          'ذخیره کردن',
          style: TextStyle(
            color: Colors.white
          ),
        )
      ),
    );
  }
}