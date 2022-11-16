import 'package:test_app/models/user.dart';

class Comment {
  final String content;
  final String commenterUsername;
  List<String> likedByUsers;
  List<Comment> childComments;

  Comment({required this.content, required this.commenterUsername, this.likedByUsers = const [], this.childComments = const []});

}