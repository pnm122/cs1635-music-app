import 'package:test_app/models/creator.dart';
import 'package:test_app/models/post.dart';

class User extends Creator {

  List<User> followers;
  List<User> following;
  List<Post> posts;

  User({required this.followers, required this.following, required this.posts, required super.name});

}