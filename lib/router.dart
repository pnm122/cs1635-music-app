import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/user_profile_page_edit_arguments.dart';
import 'package:test_app/viewmodels/homepage/comments_page_view_model.dart';
import 'package:test_app/viewmodels/homepage/search_page_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_edit_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_view_model.dart';
import 'package:test_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:test_app/widgets/common/search_page.dart';
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
      case searchRoute:
        var searchType = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<SearchPageViewModel>(
            child: SearchPage(), 
            create: (_) => SearchPageViewModel(searchType),
          )),
        );
      case editProfileRoute:
        var args = settings.arguments as UserProfilePageEditArguments;
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<UserProfilePageViewModel>.value(
            child: EditProfilePage(user: args.user,),
            value: args.viewModel,
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
