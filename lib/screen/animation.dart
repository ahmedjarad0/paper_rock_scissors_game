import 'dart:async';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double scale = 1.0;
  double turns = 1;
  Duration duration = const Duration(microseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          scale: scale,
          duration: duration,
          child: AnimatedRotation(turns: turns,
            duration: duration,
            child: TextButton(
              onPressed: () {
                setState(() {
                  scale = 2;
                  turns+=3 ;
                });
                Timer(duration, () {
                  setState(() {
                    scale = 1;
                    turns+=1 ;

                  });
                });
              },
              child: const Icon(
                Icons.access_alarm,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
