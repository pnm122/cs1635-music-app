import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import '../../models/post.dart';
import '../../models/user.dart';

_getPopularPosts(List<Post> posts) {
  //posts.shuffle();
  return posts;
}

_getFollowingPosts(List<Post> posts, List<User> following) {
  posts = posts.where((x) => following.contains(x.poster)).toList();
  //posts.shuffle();
  return posts;
}

class PostViewModel with ChangeNotifier {

  List<Post> _popularPosts = _getPopularPosts(MockData().posts);
  List<Post> get popularPosts => _popularPosts;

  List<Post> _followingPosts = _getFollowingPosts(MockData().posts, MockData().currentUser.following);
  List<Post> get followingPosts => _followingPosts;

  User get currentUser => MockData().currentUser;

  // TODO: Put this in the right viewmodel
  void likePost(Post post) {
    if(post.likedBy.contains(MockData().currentUser)) {
      post.likedBy.remove(MockData().currentUser);
      notifyListeners();
    } else { 
      post.likedBy.add(MockData().currentUser);
      notifyListeners();
    }
  }

  void follow(User user) {
    if(currentUser.following.contains(user)) {
      currentUser.following.remove(user);
      user.followers.remove(currentUser);

      // update following posts
      _followingPosts = _getFollowingPosts(MockData().posts, MockData().currentUser.following);
      notifyListeners();
    } else {
      currentUser.following.add(user);
      user.followers.add(currentUser);

      // Update following posts
      _followingPosts = _getFollowingPosts(MockData().posts, MockData().currentUser.following);
      notifyListeners();
    }
  }
}