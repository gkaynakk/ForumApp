import 'package:flutter/material.dart';
import 'post.dart';
import 'textInputWidget.dart';
import 'postList.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  MyHomePage(this.name);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      //To see the updates setState
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello World!")),
        body: Column(children: <Widget>[
          Expanded(
              child: PostList(this
                  .posts)), // his will take all the space with expanded except TextInputWidget
          TextInputWidget(this.newPost)
        ])); //Expanded fills a large area
  }
}
