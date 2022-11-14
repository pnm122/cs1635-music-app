import 'package:test_app/models/comment.dart';
import 'package:test_app/models/user.dart';

abstract class Post {
  final String posterUsername;
  final List<User> likedBy;
  List<Comment> comments;
  String text;
  bool isPinned;
  final DateTime createdTime;

  Post({required this.posterUsername,
    required this.likedBy,
    this.comments = const [],
    required this.text,
    this.isPinned = false,
    required this.createdTime
  });

}