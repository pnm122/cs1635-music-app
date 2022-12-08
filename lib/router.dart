import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/homepage/comments_page_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_edit_view_model.dart';
import 'package:test_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:test_app/widgets/homepage/comments_widget.dart';
import 'package:test_app/widgets/user_profile_page/edit_profile_page_widget.dart';
import 'models/post.dart';
import 'models/user.dart';
import 'router_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavigationBarWidget());
      case commentsRoute:
        var post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<CommentsPageViewModel>(
            child: const Comments(),
            create: (_) => CommentsPageViewModel(relatedPost: post),
          )),
        );
      case editProfileRoute:
        var user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<UserProfilePageEditViewModel>(
            child: EditProfilePage(user: user,),
            create: (_) => UserProfilePageEditViewModel(user: user),
          )),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
