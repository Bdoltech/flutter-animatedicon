import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Play/Pause Button'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              // Toggle animation on tap
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.forward();
              }
            },
            child: AnimatedIcon(
              // Use AnimatedIcons.play_pause for play/pause animation
              icon: AnimatedIcons.play_pause,
              progress: _controller,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
