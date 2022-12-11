import 'package:flutter/material.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/user.dart';

import '../../models/text_post.dart';

class TextPostViewModel with ChangeNotifier {
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
