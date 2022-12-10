import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/search_constants.dart';
import 'package:test_app/user_profile_page_edit_arguments.dart';
import 'package:test_app/viewmodels/homepage/comments_page_view_model.dart';
import 'package:test_app/viewmodels/common/search_page_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_edit_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_view_model.dart';
import 'package:test_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:test_app/widgets/common/search_page.dart';
import 'package:test_app/widgets/common/song_page.dart';
import 'package:test_app/widgets/common/comments_widget.dart';
import 'package:test_app/widgets/user_profile_page/edit_profile_page_widget.dart';
import 'package:test_app/widgets/user_profile_page/user_profile_page_widget.dart';
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
        var args = settings.arguments as List;
        // Options: userSearch, songSearch, albumSearch, artistSearch
        List<String> searchTypes = args[0];
        // Options: homepageBehavior, settingFavoriteBehavior, attachingSongBehavior, followersBehavior, followingBehavior
        // IMPORTANT: If providing settingFavorite or attachingSong, you must also provide the viewModel surrounding the page calling this,
        // so that functions can be called on those viewModels
        String searchBehavior = args[1];
        
        return MaterialPageRoute(
          builder: (_) => (ChangeNotifierProvider<SearchPageViewModel>(
            child: searchBehavior == settingFavoriteBehavior
              ? ChangeNotifierProvider<UserProfilePageViewModel>.value(
                value: args[2],
                child: const SearchPage()
              )
              : searchBehavior == attachingSongBehavior
                // TODO: Wrap a ChangeNotifierProvider.value with value of whatever upload viewmodel you make
                // Once you do that, create a function to attach the song you tap on to the post you're creating
                // You can put this function in search_tiles.dart => SearchResultTile => onTap
                ? const SearchPage()
                : const SearchPage(),
            create: (_) => SearchPageViewModel(
              searchTypes,
              args[1],
            ),
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
      case profileRoute:
        var user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<UserProfilePageViewModel>(
              child: const UserProfilePage(),
              create: (_) => UserProfilePageViewModel(u: user)
          ),
        );
        // ChangeNotifierProvider<UserProfilePageViewModel>(
        //     child: const UserProfilePage(),
        //     create: (_) => UserProfilePageViewModel()
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
