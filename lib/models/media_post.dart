import 'package:test_app/models/post.dart';
import 'package:test_app/models/song.dart';

class MediaPost extends Post {

  final String href;
  final Song song;

  MediaPost({required super.posterUsername,
    required super.likedBy,
    required super.text,
    required this.href,
    required super.createdTime,
    required this.song
  });

}