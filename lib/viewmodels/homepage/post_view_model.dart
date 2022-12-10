import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import '../../models/post.dart';
import '../../models/user.dart';

class PostViewModel with ChangeNotifier {
  List<Post> posts;
  bool isHomepage;
  bool isProfilePage;
  PostViewModel({required this.posts, this.isHomepage = false, this.isProfilePage = false});

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


}