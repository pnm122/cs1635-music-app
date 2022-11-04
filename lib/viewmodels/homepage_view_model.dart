import 'package:flutter/cupertino.dart';
// import 'dart:convert';
// import 'dart:io';
import '../models/media_post.dart';
import '../models/post.dart';
import '../models/text_post.dart';
import '../models/user.dart';

List<Post> initialData = List.from([
  TextPost(
      likedBy: List.empty(),
      poster: User(
          name: "Kris Martin",
          followers: List.empty(),
          following: List.empty(),
          posts: List.empty()),
      text: "Look at the stars, look how they shine for you"),
  TextPost(
      likedBy: List.empty(),
      poster: User(
          name: "Billy Goat",
          followers: List.empty(),
          following: List.empty(),
          posts: List.empty()),
      text: "Bebop"),
  MediaPost(
      likedBy: List.empty(),
      poster: User(
          name: "Sean Dyche",
          followers: List.empty(),
          following: List.empty(),
          posts: List.empty()),
      text: "I didn't actually eat the worms",
      href:
          "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761")
]);

class HomepageViewModel with ChangeNotifier {
  final List<Post> _popularPosts = initialData;

  List<Post> get popularPosts => _popularPosts;
}
