import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/search_constants.dart';
import 'package:test_app/viewmodels/homepage/comments_page_view_model.dart';
import 'package:test_app/viewmodels/common/search_page_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_edit_view_model.dart';
import 'package:test_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:test_app/widgets/common/search_page.dart';
import 'package:test_app/widgets/common/song_page.dart';
import 'package:test_app/widgets/common/comments_widget.dart';
import 'package:test_app/widgets/user_profile_page/edit_profile_page_widget.dart';
import 'models/post.dart';
import 'models/user.dart';
import 'router_constants.dart';
import 'viewmodels/common/song_page_view_model.dart';

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
        // TODO: Decide what argument I might pass in here to modify how the search page appears
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<SearchPageViewModel>(
            child: const SearchPage(),
            create: (_) => SearchPageViewModel(userSearch),
          )),
        );
      case songRoute:
        var song = settings.arguments as Song;
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<SongPageViewModel>(
            child: const SongPage(),
            create: (_) => SongPageViewModel(song),
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
