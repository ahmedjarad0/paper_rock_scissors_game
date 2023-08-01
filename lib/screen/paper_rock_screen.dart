import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class PaperRockScreen extends StatefulWidget {
  const PaperRockScreen({Key? key}) : super(key: key);

  @override
  State<PaperRockScreen> createState() => _PaperRockScreenState();
}

class _PaperRockScreenState extends State<PaperRockScreen> {
  int _userPicker = 0;
  int _systemPicker = 0;
  int _scoreYou = 0;
  int _scoreSystem = 0;
  double _turns = 0.0;
  Duration duration = const Duration(microseconds: 200);
  bool _isPlay = false;


  void play(int choice) {
    setState(() {
      _isPlay = true;
       _turns +=1.0;
      _userPicker = choice;
    });


    Timer(const Duration(seconds: 1), () {
      setState(() {
        _systemPicker = Random().nextInt(3);
        _isPlay = false;
        roundWinner();
      });
    });
  }

  void roundWinner() {
    if (_userPicker == 1 && _systemPicker == 0 ||
        _userPicker == 0 && _systemPicker == 2 ||
        _userPicker == 2 && _systemPicker == 1) {
      ++_scoreSystem;
    } else if (_userPicker != _systemPicker) {
      ++_scoreYou;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Paper rock game',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: _isPlay ? 1 : 0,
            duration: duration,
            child: AnimatedRotation(
              turns: _turns,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInBack,
              child: Column(
                children: [
                  Image.asset(
                    'images/btn0.png',
                    height: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/btn1.png',
                        height: 30,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/btn2.png',
                        height: 30,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AnimatedScale(
                    scale: _isPlay ? 0 : 1.0,
                    curve: Curves.easeInBack,
                    duration: duration,
                    child: Image.asset(
                      'images/btn$_userPicker.png',
                      height: 150,
                    ),
                  ),
                  const Text(
                    'You',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                        fontSize: 18),
                  ),
                ],
              ),
              const Text(
                'Vs',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Column(
                children: [
                  Image.asset(
                    'images/btn$_systemPicker.png',
                    height: 150,
                  ),
                  const Text(
                    'System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                        fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          TextButton(
              onPressed: () {
                play(0);
              },
              child: Image.asset(
                'images/btn0.png',
                height: 80,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    play(1);
                  },
                  child: Image.asset(
                    'images/btn1.png',
                    height: 80,
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      play(2);
                    });
                  },
                  child: Image.asset(
                    'images/btn2.png',
                    height: 80,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
