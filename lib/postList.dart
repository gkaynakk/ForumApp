import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;

  PostList(this.listItems, this.user);
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // helps us construct items in the list
      itemCount:
          this.widget.listItems.length, // just defining how many items inside
      itemBuilder: (context, index) {
        // we have some context and index we can use the index to display specific items
        var post = this.widget.listItems[index];

        return Card(
            child: Row(//seperates our items -block
                children: <Widget>[
          Expanded(
              child: ListTile(
            title: Text(post.body),
            subtitle: Text(post.author),
          )),
          Row(
            children: <Widget>[
              Container(
                child: Text(post.usersLiked.length.toString(),
                    style: TextStyle(fontSize: 20)),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ), //space between contents
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => this.like(() => post.likePost(widget
                      .user)), //  we call callback it will call post.likePost and pass the argument widget.user
                  //fat arrow is simply like a return statement
                  color: post.usersLiked.contains(widget.user.uid)
                      ? Colors.blueAccent
                      : Colors
                          .grey) // if it is true make it red if not make it grey
            ],
          )
        ]));
      },
    );
  }
}
