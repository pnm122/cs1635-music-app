import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/router_constants.dart';
import 'package:test_app/search_constants.dart';
import 'package:test_app/viewmodels/homepage/homepage_view_model.dart';
import 'package:test_app/viewmodels/homepage/post_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';
import 'package:test_app/widgets/common/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Your Feed",
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, searchRoute, arguments: [[userSearch, songSearch], homepageBehavior]);
              },
              icon: const Icon(Icons.search)
            )
          ],
          tabs: const [
              Tab(
                child: Text("Popular"),
              ),
              Tab(
                child: Text("Following"),
              ),
            ],
        ),
        
        body: const TabBarView(
          children: <Widget>[
            // refer to pierce_explanations for why these are separate widgets now
            PopularPosts(),

            FollowingPosts(),
          ],
        ),
      ),
    );
  }
}


class PopularPosts extends StatelessWidget {
  const PopularPosts({super.key});

  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = PostViewModel(posts: context.watch<HomePageViewModel>().popularPosts, isHomepage: true);
    return ChangeNotifierProvider<PostViewModel>(
      child: PostView(postViewModel: postViewModel),
      create: (_) => postViewModel,
    );
  }
}

class FollowingPosts extends StatelessWidget {
  const FollowingPosts({super.key});

  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = PostViewModel(posts: context.watch<HomePageViewModel>().followingPosts, isHomepage: true);
    return ChangeNotifierProvider<PostViewModel>(
      child: PostView(postViewModel: postViewModel),
      create: (_) => postViewModel,
    );
  }
}
