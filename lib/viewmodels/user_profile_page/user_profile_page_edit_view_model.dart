import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';

import '../../models/user.dart';

class UserProfilePageEditViewModel with ChangeNotifier {
  UserProfilePageEditViewModel({required this.user});
  User user;

  edit(String name, String bio) {

    if (name.length >= 5) {
      user.name = name;
    }

    user.profile.bio = bio;
  }
}