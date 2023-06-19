import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:university_project/custom_widgets/custom_push.dart';
import 'package:university_project/login/login.dart';

import '../../custom_widgets/custom_push_replacement.dart';
import '../../custom_widgets/custom_text_main.dart';

class ChooseStatus extends StatefulWidget {
  const ChooseStatus({super.key});

  @override
  State<ChooseStatus> createState() => _ChooseStatusState();
}

class _ChooseStatusState extends State<ChooseStatus> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey _textFieldKey = GlobalKey();
  String? _selectedItem = 'Item 1';

  @override
  void initState() {
    super.initState();
    _controller.text = _selectedItem!;
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
                      customPushReplacement(context, Login());
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 80, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomTextMain(text: 'Select your status'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        key: _textFieldKey,
                        controller: _controller,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Select a category',
                        ),
                        onTap: () {
                          final RenderBox textFieldRenderBox =
                              _textFieldKey.currentContext!.findRenderObject()
                                  as RenderBox;
                          final textFieldSize = textFieldRenderBox.size;
                          final textFieldPosition =
                              textFieldRenderBox.localToGlobal(Offset.zero);
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                              textFieldPosition.dx + textFieldSize.width,
                              textFieldPosition.dy + textFieldSize.height + 1,
                              textFieldPosition.dx,
                              textFieldPosition.dy + textFieldSize.height,
                            ),
                            items: <String>[
                              'Item 1',
                              'Item 2',
                              'Item 3',
                              'Item 4'
                            ]
                                .map((String value) => PopupMenuItem<String>(
                                      value: value,
                                      child: SizedBox(
                                        width: textFieldSize.width,
                                        child: Text(value),
                                      ),
                                    ))
                                .toList(),
                          ).then((String? value) {
                            if (value != null) {
                              setState(() {
                                _selectedItem = value;
                                _controller.text = value;
                              });
                            }
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              switch (_selectedItem) {
                                case 'Item 1':
                                  customPush(context, Login());
                                  break;
                                case 'Item 2':
                                  customPush(context, Login());
                                  break;
                                case 'Item 3':
                                  customPush(context, Login());
                                  break;
                                case 'Item 4':
                                  customPush(context, Login());
                                  break;
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text:
                                          'In the following, you agree to our '),
                                  TextSpan(
                                      text:
                                          'Terms of Service and Privacy Policy.',
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          customPush(context, Login());
                                        }),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
