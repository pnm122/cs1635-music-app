import 'package:test_app/models/user.dart';

abstract class Post {
  User poster;
  List<User> likedBy;
  String text;

  Post({required this.poster, required this.likedBy, required this.text});

}