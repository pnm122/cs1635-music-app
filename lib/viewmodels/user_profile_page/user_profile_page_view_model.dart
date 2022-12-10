import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/artist.dart';
import 'package:test_app/search_constants.dart';

import '../../models/album.dart';
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

class UserProfilePageViewModel with ChangeNotifier {
  late final User _user;
  late final String _followersCnt;
  late final String _followingCnt;
  late final bool _editAvailable;

  UserProfilePageViewModel({User? u}) {
    _user = u == null ? MockData().currentUser : u;
    _followersCnt = countToString(_user.followers.length);
    _followingCnt = countToString(MockData().currentUser.following.length);
    _editAvailable = u == null;
  }

  User get user => _user;
  String get followersCnt => _followersCnt;
  String get followingCnt => _followingCnt;
  bool get editAvailable => _editAvailable;

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
}