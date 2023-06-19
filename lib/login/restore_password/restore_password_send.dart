import 'package:flutter/material.dart';
import 'package:university_project/custom_widgets/custom_push.dart';
import 'package:university_project/custom_widgets/custom_push_replacement.dart';
import 'package:university_project/custom_widgets/custom_text_main.dart';
import 'package:university_project/login/login.dart';
import 'package:university_project/login/restore_password/restore_password_sent.dart';

import '../../custom_widgets/custom_email.dart';

class RestorePasswordSend extends StatefulWidget {
  const RestorePasswordSend({super.key});

  @override
  State<RestorePasswordSend> createState() => _RestorePasswordSendState();
}

class _RestorePasswordSendState extends State<RestorePasswordSend> {
  final _emailController = TextEditingController();
  bool _isEmailInvalid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: ListView(children: [
                AppBar(
                  leading: IconButton(
                      onPressed: () {
                        customPushReplacement(context, Login());
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 80, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextMain(text: 'Restore Password'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CustomEmail(
                          emailController: _emailController,
                          isEmailInvalid: _isEmailInvalid,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  final emailRegExp = RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                  if (!emailRegExp
                                      .hasMatch(_emailController.text)) {
                                    setState(() => _isEmailInvalid = true);
                                  } else {
                                    setState(() => _isEmailInvalid = false);
                                  }
                                  if (!_isEmailInvalid) {
                                    customPush(context, RestorePasswordSent());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide.none,
                                ),
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
