import 'package:test_app/models/post.dart';

class MediaPost extends Post {

  String href;

  MediaPost({required super.poster, required super.likedBy, required super.text, required this.href});

}