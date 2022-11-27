import 'package:test_app/models/post.dart';

class TextPost extends Post {
  TextPost({
    required super.poster,
    required super.likedBy,
    required super.text,
    required super.createdTime,
    super.isPinned,
    super.comments,
  });
}
