import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function callback; // can not be changed

  TextInputWidget(this.callback);
  // we typed stful
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState(); //set up here
}

class _TextInputWidgetState extends State<TextInputWidget> {
  // build here
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.deepPurple,
              tooltip: "Post message",
              onPressed: this.click,
            )));
  }
}
