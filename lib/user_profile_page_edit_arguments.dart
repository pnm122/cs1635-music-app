import 'package:test_app/viewmodels/user_profile_page/user_profile_page_view_model.dart';

import 'models/user.dart';

class UserProfilePageEditArguments {
  UserProfilePageViewModel viewModel;
  User user;

  UserProfilePageEditArguments({required this.viewModel, required this.user});
}