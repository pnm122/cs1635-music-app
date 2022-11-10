import 'package:test_app/models/comment.dart';
import 'package:test_app/models/user.dart';

abstract class Post {
  final User poster;
  final List<User> likedBy;
  final List<Comment> comments;
  String text;
  bool isPinned;
  final DateTime createdTime;

  Post({required this.poster,
    required this.likedBy,
    this.comments = const [],
    required this.text,
    this.isPinned = false,
    required this.createdTime
  });

}