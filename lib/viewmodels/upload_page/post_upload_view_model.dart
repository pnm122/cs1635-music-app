import 'package:flutter/material.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/media_post.dart';
import 'package:test_app/models/text_post.dart';
import 'package:test_app/models/user.dart';

class PostUploadViewModel with ChangeNotifier {
  void addMedia(String url) {
    User poster = MockData().currentUser;

    // Create the post
    MediaPost newPost = MediaPost(
      poster: poster,
      likedBy: [],
      text: "",
      href: url,
      createdTime: DateTime.now().toUtc(),
      song: MockData().songs.first,
    );

    // Add to poster's profile
    poster.posts.add(newPost);

    // Also add to popular page
    MockData().posts.add(newPost);

    notifyListeners();
  }

  void addPost(String data) {
    User poster = MockData().currentUser;

    // Create the post
    TextPost newPost = TextPost(
      poster: poster,
      likedBy: [],
      text: data,
      createdTime: DateTime.now().toUtc(),
      isPinned: false,
    );

    // Add to poster's profile
    poster.posts.add(newPost);

    // Also add to popular page
    MockData().posts.add(newPost);

    notifyListeners();
  }
}
