import 'package:test_app/models/creator.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/models/profile.dart';

class User extends Creator {

  final List<String> followersUsername;
  final List<String> followingUsername;
  final Profile profile;
  final List<Post> posts;

  User({this.followersUsername = const [],
    this.followingUsername = const [],
    required this.profile,
    this.posts = const [],
    required super.name,
    required super.image
  });

}