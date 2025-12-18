import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';

class AppBarSearchTextField extends StatelessWidget {
  AppBarSearchTextField({
    super.key,
  });

  final TextEditingController searchBarTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchBarTextEditingController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'جستجوی سریع',
        hintText: 'نام، دسته بندی ...',
        suffixIcon: Icon(CupertinoIcons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppSolidColors.lightBorder,
          ),
          borderRadius: .circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppSolidColors.accent,
          ),
          borderRadius: .circular(12),
        ),
      ),
    );
  }
}