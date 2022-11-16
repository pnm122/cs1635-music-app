import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import '../../models/post.dart';
import '../../models/user.dart';

_getPopularPosts(List<Post> posts) {
  posts.shuffle();
  return posts;
}

_getFollowingPosts(List<Post> posts, List<User> following) {
  posts = posts.where((x) => following.contains(x.poster)).toList();
  posts.shuffle();
  return posts;
}

class HomepageViewModel with ChangeNotifier {

  final List<Post> _popularPosts = _getPopularPosts(MockData().posts);
  List<Post> get popularPosts => _popularPosts;

  final List<Post> _followingPosts = _getFollowingPosts(MockData().posts, MockData().currentUser.following);
  List<Post> get followingPosts => _followingPosts;

  static User get currentUser => MockData().currentUser;

  void likePost(Post post) {
    if(post.likedBy.contains(MockData().currentUser)) {
      post.likedBy.remove(MockData().currentUser);
    } else { 
      post.likedBy.add(MockData().currentUser);
    }
  }

  void follow(User user) {
    if(currentUser.following.contains(user)) {
      currentUser.following.remove(user);
      user.followers.remove(currentUser);
    } else {
      currentUser.following.add(user);
      user.followers.add(currentUser);
    }
  }
}