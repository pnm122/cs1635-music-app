import 'package:flutter/material.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/post.dart';

class HomePageViewModel with ChangeNotifier {
  final List<Post> _popularPosts = MockData().posts;
  List<Post> _followingPosts = MockData().posts.where((x) => MockData().currentUser.following.contains(x.poster)).toList();

  List<Post> get popularPosts => _popularPosts;
  List<Post> get followingPosts => _followingPosts;

  updateFollowingPosts() {
    _followingPosts = MockData().posts.where((x) => MockData().currentUser.following.contains(x.poster)).toList();
    notifyListeners();
  }
}
