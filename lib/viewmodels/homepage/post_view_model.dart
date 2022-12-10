import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import '../../models/post.dart';
import '../../models/user.dart';
import '../../widgets/homepage/post_organize_type.dart';

_getPopularPosts(List<Post> posts) {
  return posts;
}

_getFollowingPosts(List<Post> posts, List<User> following) {
  posts = posts.where((x) => following.contains(x.poster)).toList();
  return posts;
}


_getUserPosts(List<Post> posts, User user) {
  posts = posts.where((x) => x.poster == user).toList();
  List<Post> isPinned = List.empty(growable: true);
  List<Post> isNotPinned = List.empty(growable: true);

  for (var post in posts) {
    if (post.isPinned) {
      isPinned.add(post);
    } else {
      isNotPinned.add(post);
    }
  }

  return isPinned + isNotPinned;
}

class PostViewModel with ChangeNotifier {

  bool openComments = false;

  Post? commentsPost;

  void openPostComments(Post post) {
    commentsPost = post;
    openComments = true;
  }

  void closePostComments() {
    openComments = false;
  }

  User get currentUser => MockData().currentUser;

  List<Post> getPosts({required PostOrganizeType postOrganizeType, User? user}) {
    switch (postOrganizeType) {
      case PostOrganizeType.popular:
        return _getPopularPosts(MockData().posts);
      case PostOrganizeType.following:
        return _getFollowingPosts(MockData().posts, MockData().currentUser.following);
      case PostOrganizeType.user:
        return _getUserPosts(MockData().posts, user!);
    }
  }

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
      //_followingPosts = _getFollowingPosts(MockData().posts, MockData().currentUser.following);
      notifyListeners();
    } else {
      currentUser.following.add(user);
      user.followers.add(currentUser);

      // Update following posts
      //_followingPosts = _getFollowingPosts(MockData().posts, MockData().currentUser.following);
      notifyListeners();
    }
  }

  void pinPress(Post post) {
    if (currentUser != post.poster) {
      return;
    }

    post.isPinned = !post.isPinned;
    notifyListeners();
  }
}