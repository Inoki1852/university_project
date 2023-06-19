import 'package:flutter/material.dart';

import 'package:university_project/custom_widgets/custom_push_replacement.dart';
import 'package:university_project/custom_widgets/custom_text_main.dart';
import 'package:university_project/login/login.dart';

import 'package:university_project/login/restore_password/restore_password_sent.dart';

class RestorePasswordNew extends StatefulWidget {
  const RestorePasswordNew({super.key});

  @override
  State<RestorePasswordNew> createState() => _RestorePasswordNewState();
}

class _RestorePasswordNewState extends State<RestorePasswordNew> {
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();
  bool _isPasswordInvalid1 = false;
  bool _isPasswordInvalid2 = false;
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  String _errorText1 = "";
  String _errorText2 = "";

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
                        customPushReplacement(context, RestorePasswordSent());
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 80, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextMain(text: 'Create a new password'),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            controller: _passwordController1,
                            obscureText: !_isPasswordVisible1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isPasswordInvalid1
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              labelText: 'New password',
                              errorText:
                                  _isPasswordInvalid1 ? _errorText1 : null,
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible1
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() => _isPasswordVisible1 =
                                      !_isPasswordVisible1);
                                },
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _passwordController2,
                          obscureText: !_isPasswordVisible2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _isPasswordInvalid2
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                            labelText: 'Repeat new password',
                            errorText: _isPasswordInvalid2 ? _errorText2 : null,
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() =>
                                    _isPasswordVisible2 = !_isPasswordVisible2);
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_passwordController1.text == '') {
                                    setState(() {
                                      _isPasswordInvalid1 = true;
                                      _errorText1 = 'Password cannot be empty';
                                    });
                                  }
                                  if (_passwordController2.text == '') {
                                    setState(() {
                                      _isPasswordInvalid2 = true;
                                      _errorText2 = 'Password cannot be empty';
                                    });
                                  }
                                  if (_passwordController1.text == '' &&
                                      _passwordController2.text != '') {
                                    setState(() {
                                      _isPasswordInvalid2 = true;
                                      _errorText2 =
                                          'Passwords must be the same';
                                    });
                                  }
                                  if (_passwordController2.text == '' &&
                                      _passwordController1.text != '') {
                                    setState(() {
                                      _isPasswordInvalid1 = true;
                                      _errorText1 =
                                          'Passwords must be the same';
                                    });
                                  }
                                  if (_passwordController1.text !=
                                          _passwordController2.text &&
                                      _passwordController1.text != '' &&
                                      _passwordController2.text != '') {
                                    setState(() {
                                      _isPasswordInvalid1 = true;
                                      _isPasswordInvalid2 = true;
                                      _errorText1 =
                                          'Passwords must be the same';
                                      _errorText2 =
                                          'Passwords must be the same';
                                    });
                                  } else if (_passwordController1.text != '' &&
                                      _passwordController2.text != '') {
                                    setState(() {
                                      _isPasswordInvalid1 = false;
                                      _isPasswordInvalid2 = false;
                                    });
                                    customPushReplacement(context, Login());
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
