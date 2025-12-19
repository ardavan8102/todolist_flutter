import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Text(
      title,
      style: textTheme.titleLarge,
    );
  }
}