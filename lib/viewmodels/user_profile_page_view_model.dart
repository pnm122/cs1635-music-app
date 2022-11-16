import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/artist.dart';

import '../models/album.dart';
import '../models/profile.dart';
import '../models/track.dart';
import '../models/user.dart';

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
  final User _user = MockData().currentUser;
  User get user => _user;

  final String _followersCnt = countToString(MockData().currentUser.followers.length);
  String get followersCnt => _followersCnt;

  final String _followingCnt = countToString(MockData().currentUser.following.length);
  String get followingCnt => _followingCnt;
}