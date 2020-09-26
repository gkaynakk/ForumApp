import 'package:firebase_database/firebase_database.dart';
import 'post.dart';

final databaseReference =
    FirebaseDatabase.instance.reference(); //reference to db

DatabaseReference savePost(Post post) {
  //take a post object do some stuff and then automatically save
  var id = databaseReference.child('posts/').push(); //give unique id to posts
  id.set(post.toJson()); //will save the map in the db
  return id;
}
