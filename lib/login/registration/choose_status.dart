// Import Flutter packages for gestures and material design widgets
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Import login screen widget
import 'package:university_project/login/login.dart';

// Import custom widget for navigating to a new page with a fade transition
import 'package:university_project/custom_widgets/custom_push.dart';

// Import custom widgets for replacing the current page with a new page with a fade transition and text display
import '../../custom_widgets/custom_push_replacement.dart';
import '../../custom_widgets/custom_text_main.dart';

// Define ChooseStatus class as a StatefulWidget
class ChooseStatus extends StatefulWidget {
  // Declare a constructor with an optional key parameter
  const ChooseStatus({super.key});

  // Override createState method to create the mutable state for this widget
  @override
  State<ChooseStatus> createState() => _ChooseStatusState();
}

// Define a state class for the ChooseStatus widget
class _ChooseStatusState extends State<ChooseStatus> {
  // Declare a final field for storing the text controller
  final TextEditingController _controller = TextEditingController();

  // Declare a final field for storing the global key for the text field widget
  final GlobalKey _textFieldKey = GlobalKey();

  // Declare a nullable field for storing the selected item from the menu
  String? _selectedItem = 'Item 1';

  // Override initState method to initialize the text controller with the selected item
  @override
  void initState() {
    super.initState();
    _controller.text = _selectedItem!;
  }

  // Override build method to construct the widget
  @override
  Widget build(BuildContext context) {
    // Return a SafeArea widget that provides safe insets for the visible part of the interface
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        // Set the body as a Center widget with a ConstrainedBox child
        body: Center(
          child: ConstrainedBox(
            // Set the maximum width constraint for the child
            constraints: BoxConstraints(maxWidth: 400),
            // Set the child as a ListView widget with child widgets for displaying the app bar, text and text field with menu
            child: ListView(
              children: [
                // Add an AppBar widget with a leading icon button that navigates to the login screen when pressed
                AppBar(
                  leading: IconButton(
                    onPressed: () {
                      customPushReplacement(context, Login());
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                // Add a Padding widget that adds padding around its child widget
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 80, bottom: 25),
                  // Add a Column widget that contains child widgets with alignment to the left edge
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Add a custom text widget with the main style and text 'Select your status'
                      CustomTextMain(text: 'Select your status'),
                    ],
                  ),
                ),
                // Add a Padding widget that adds padding around its child widget
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // Add a Column widget that contains child widgets
                  child: Column(
                    children: [
                      // Add a TextField widget with the text controller and a custom decoration and set it as read-only and tappable
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
                          // Get the render box of the text field widget using its global key and context
                          final RenderBox textFieldRenderBox =
                              _textFieldKey.currentContext!.findRenderObject()
                                  as RenderBox;
                          // Get the size of the text field widget using its render box
                          final textFieldSize = textFieldRenderBox.size;
                          // Get the position of the text field widget using its render box and offset
                          final textFieldPosition =
                              textFieldRenderBox.localToGlobal(Offset.zero);
                          // Show a menu below the text field widget with items from a list of strings
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
                                      // Set the value of the menu item as the string value
                                      value: value,
                                      // Set the child of the menu item as a SizedBox widget with a Text child
                                      child: SizedBox(
                                        // Set the width of the SizedBox widget as the same as the text field widget
                                        width: textFieldSize.width,
                                        // Set the child of the SizedBox widget as a Text widget with the string value
                                        child: Text(value),
                                      ),
                                    ))
                                .toList(),
                          ).then((String? value) {
                            // Check if the selected value is not null
                            if (value != null) {
                              // Update the state with the selected value and set it to the text controller
                              setState(() {
                                _selectedItem = value;
                                _controller.text = value;
                              });
                            }
                          });
                        },
                      ),
                      // Add a Padding widget with padding on top
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        // Add a SizedBox widget with infinite width and an ElevatedButton child
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            // Set the onPressed handler for the button
                            onPressed: () {
                              // Use a switch statement to handle different cases based on the selected item
                              switch (_selectedItem) {
                                case 'Item 1':
                                  // Navigate to the login screen
                                  customPush(context, Login());
                                  break;
                                case 'Item 2':
                                  // Navigate to the login screen
                                  customPush(context, Login());
                                  break;
                                case 'Item 3':
                                  // Navigate to the login screen
                                  customPush(context, Login());
                                  break;
                                case 'Item 4':
                                  // Navigate to the login screen
                                  customPush(context, Login());
                                  break;
                              }
                            },
                            // Set the child of the button as a Text widget with text 'Submit'
                            child: Text('Submit'),
                          ),
                        ),
                      ),
                      // Add a Center widget with a Column child
                      Center(
                        child: Column(children: [
                          // Add a Padding widget with padding on top
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            // Add a RichText widget for displaying formatted text with gesture recognition
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                // Set the children of the text span as a list of text spans with different styles and recognizers
                                children: [
                                  // Add a text span with text 'In the following, you agree to our '
                                  TextSpan(
                                      text:
                                          'In the following, you agree to our '),
                                  // Add a text span with text 'Terms of Service and Privacy Policy.' and a custom style and recognizer
                                  TextSpan(
                                      text:
                                          'Terms of Service and Privacy Policy.',
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigate to the login screen when tapped
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
