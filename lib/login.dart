import 'package:flutter/material.dart';
import 'package:hello_world/myHomePage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Hello World!")), body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name;
  TextEditingController controller = new TextEditingController();

  void click() {
    this.name = controller.text;
    Navigator.push(
        //pushing stack on to the navigator
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: this.controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_pin),
                labelText: "What's your name?",
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 5, color: Colors.orangeAccent)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.check),
                  splashColor: Colors.deepPurple,
                  tooltip: "Submit",
                  onPressed: this.click,
                ),
              ),
            )));
  }
}
