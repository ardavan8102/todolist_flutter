import 'package:flutter/material.dart';

class SplashProgress extends StatefulWidget {
  const SplashProgress({super.key});

  @override
  State<SplashProgress> createState() => _SplashProgressState();
}

class _SplashProgressState extends State<SplashProgress>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        valueColor: _controller.drive(
          ColorTween(
            begin: Colors.white24,
            end: Colors.blueAccent,
          ),
        ),
        backgroundColor: Colors.white10,
      ),
    );
  }
}