import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);
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
          Row(children: <Widget>[
            Container(
              child:
                  Text(post.likes.toString(), style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ), //space between contents
            IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => this.like(post
                    .likePost), //fat arrow is simply like a return statement
                color: post.userLiked
                    ? Colors.blueAccent
                    : Colors
                        .grey // if it is true make it red if not make it grey
                )
          ])
        ]));
      },
    );
  }
}
