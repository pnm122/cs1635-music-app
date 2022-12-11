import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/artist.dart';
import 'package:test_app/search_constants.dart';

import '../../models/album.dart';
import '../../models/post.dart';
import '../../models/profile.dart';
import '../../models/track.dart';
import '../../models/user.dart';

String countToString(int cnt) {
  String str = '';

  if (cnt >= 1000000000) {
    str += (cnt / 1000000000).floor().toString();
    str += "B";
  } else if (cnt >= 1000000) {
    str += (cnt / 1000000).floor().toString();
    str += "M";
  } else if (cnt >= 1000) {
    str += (cnt / 1000).floor().toString();
    str += "K";
  } else {
    str += cnt.toString();
  }

  return str;
}

List<Post> _getUserPosts(User user) {
  var posts = user.posts.where((x) => x.poster == user).toList();
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

class UserProfilePageViewModel with ChangeNotifier {
  late final User _user;
  late final String _followersCnt;
  late final String _followingCnt;
  late final bool _editAvailable;
  late List<Post> _posts;

  UserProfilePageViewModel({User? u}) {
    _user = u ?? MockData().currentUser;
    _followersCnt = countToString(_user.followers.length);
    _followingCnt = countToString(MockData().currentUser.following.length);
    _editAvailable = u == null;
    _posts = _getUserPosts(user);
    notifyListeners();
  }

  User get user => _user;
  String get followersCnt => _followersCnt;
  String get followingCnt => _followingCnt;
  bool get editAvailable => _editAvailable;
  User get currentUser => MockData().currentUser;
  List<Post> get posts => _posts;

  edit(String name, String bio) {

    if (name.length >= 5) {
      user.name = name;
    }

    user.profile.bio = bio;
    notifyListeners();
  }

  setFavorite(String type, var item) {
    switch(type) {
      case songSearch:
        user.profile.favoriteSong = item;
        break;
      case albumSearch:
        user.profile.favoriteAlbum = item;
        break;
      case artistSearch:
        user.profile.favoriteArtist = item;
        break;
    }
    notifyListeners();
  }

  void pinPress(Post post) {
    if (currentUser != post.poster) {
      return;
    }

    post.isPinned = !post.isPinned;
    _posts = _getUserPosts(user);
    notifyListeners();
  }
}