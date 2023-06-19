import 'dart:async';

import 'package:flutter/material.dart';
import 'package:university_project/login/restore_password/restore_password_new.dart';
import 'package:university_project/login/restore_password/restore_password_send.dart';

import '../../custom_widgets/custom_push.dart';
import '../../custom_widgets/custom_push_replacement.dart';
import '../../custom_widgets/custom_text_main.dart';

class RestorePasswordSent extends StatefulWidget {
  const RestorePasswordSent({super.key});

  @override
  State<RestorePasswordSent> createState() => _RestorePasswordSentState();
}

class _RestorePasswordSentState extends State<RestorePasswordSent> {
  late bool _isSent = false;
  String _text = 'The letter was sent to your email!';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 450), () {
      setState(() {
        _isSent = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: ListView(
                children: [
                  AppBar(
                    leading: IconButton(
                        onPressed: () {
                          customPushReplacement(context, RestorePasswordSend());
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12, right: 12, top: 80, bottom: 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextMain(text: _text),
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[50]?.withAlpha(100),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: _isSent
                                          ? GestureDetector(
                                              onTap: () {
                                                customPush(context,
                                                    RestorePasswordNew());
                                              },
                                              child: Image.asset(
                                                'assets/images/box_sent.png',
                                                key: ValueKey('sent'),
                                              ),
                                            )
                                          : Image.asset(
                                              'assets/images/box_to_send.png',
                                              key: ValueKey('to_send'),
                                            ),
                                    ),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Center(
                            child: Column(children: [
                              Text('Didn\'t get the message?'),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _text =
                                          'The letter was resent to your email!';
                                    });
                                  },
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                        color: Colors.blue[800],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
