import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/artist.dart';

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

  UserProfilePageViewModel({User? u}) {
    _user = u == null ? MockData().currentUser : u;
  }

  User get user => _user;

  final String _followersCnt = countToString(MockData().currentUser.followers.length);
  String get followersCnt => _followersCnt;

  final String _followingCnt = countToString(MockData().currentUser.following.length);
  String get followingCnt => _followingCnt;

  edit(String name, String bio) {

    if (name.length >= 5) {
      user.name = name;
    }

    user.profile.bio = bio;
    notifyListeners();
  }
}