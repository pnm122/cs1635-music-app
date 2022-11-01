import 'package:test_app/models/user.dart';

abstract class Post {
  User poster;
  List<User> likedBy;

  Post({required this.poster, required this.likedBy});

}