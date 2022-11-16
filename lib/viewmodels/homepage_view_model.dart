import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import '../models/post.dart';
import '../models/user.dart';

class HomepageViewModel with ChangeNotifier {

  final List<Post> _popularPosts = MockData().posts;
  List<Post> get popularPosts => _popularPosts;

  User get currentUser => MockData().currentUser;

  void likePost(Post post) {
    if(post.likedBy.contains(MockData().currentUser)) {
      post.likedBy.remove(MockData().currentUser);
    } else { 
      post.likedBy.add(MockData().currentUser);
    }
  }
}