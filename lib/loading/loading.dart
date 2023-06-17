import 'dart:async';
import 'package:flutter/material.dart';
import 'package:university_project/custom_widgets/custom_push_replacement.dart';

import '../login/login.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
      value: 0.5,
      lowerBound: 0,
      upperBound: 1,
    );
    _controller.repeat();
    Timer(Duration(milliseconds: 2500), () {
      _controller.stop();
      customPushReplacement(context, Login());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
              turns: Tween(begin: 0.0, end: 2.5).animate(_controller),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Image.asset(
              'assets/images/logo_shadow.png',
              width: 50,
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Loading...',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
