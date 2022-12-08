import 'package:test_app/models/creator.dart';
import 'package:test_app/models/media_post.dart';

abstract class Song {
  final String name;
  final Creator creator;
  final List<MediaPost> covers;

  Song({required this.name, required this.creator, this.covers = const []});
}
