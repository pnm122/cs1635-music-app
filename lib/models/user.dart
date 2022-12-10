import 'package:test_app/models/creator.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/models/profile.dart';

class User extends Creator {

  final List<User> followers;
  final List<User> following;
  final Profile profile;
  final List<Post> posts;

  User({this.followers = const [],
    this.following = const [],
    required this.profile,
    required this.posts,
    required super.name,
    required super.image
  });

}