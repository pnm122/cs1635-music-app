import 'package:test_app/models/user.dart';

class Comment {
  final String content;
  final User commenter;
  List<User> likedBy;
  List<Comment> childComments;

  Comment({required this.content, required this.commenter, this.likedBy = const [], this.childComments = const []});

}