import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isEmailInvalid = false;
  bool _isPasswordInvalid = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 40, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome!',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700)),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    _isEmailInvalid ? Colors.red : Colors.black,
                              ),
                            ),
                            labelText: 'Email',
                            errorText: _isEmailInvalid ? 'Wrong e-mail' : null,
                            suffixIcon: _isEmailInvalid
                                ? Icon(Icons.error, color: Colors.red)
                                : null,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isEmailInvalid
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              labelText: 'Password',
                              errorText: _isPasswordInvalid
                                  ? 'Password cannot be empty'
                                  : null,
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() =>
                                      _isPasswordVisible = !_isPasswordVisible);
                                },
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue[800],
                                ),
                                child: Text('Register'),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
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
                                  if (_passwordController.text.isEmpty) {
                                    setState(() => _isPasswordInvalid = true);
                                  } else {
                                    setState(() => _isPasswordInvalid = false);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide.none,
                                ),
                                child: Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Center(
                        child: Column(children: [
                          Text('Forgot the password?'),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: () {
                                // print('Tapped!');
                              },
                              child: Text(
                                'Restore',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ]),
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