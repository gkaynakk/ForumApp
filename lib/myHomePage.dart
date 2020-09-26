import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/database.dart';
import 'post.dart';
import 'textInputWidget.dart';
import 'postList.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;

  MyHomePage(this.user);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      //To see the updates setState
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello World!")),
        body: Column(children: <Widget>[
          Expanded(
              child: PostList(
                  this.posts,
                  widget
                      .user)), // his will take all the space with expanded except TextInputWidget
          TextInputWidget(this.newPost)
        ])); //Expanded fills a large area
  }
}
