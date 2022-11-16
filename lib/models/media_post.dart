import 'package:test_app/models/post.dart';
import 'package:test_app/models/song.dart';

class MediaPost extends Post {

  final String href;
  final Song song;

  MediaPost({required super.poster,
    required super.likedBy,
    required super.text,
    required this.href,
    required super.createdTime,
    required this.song,
    super.isPinned,
    super.comments,
  });

}