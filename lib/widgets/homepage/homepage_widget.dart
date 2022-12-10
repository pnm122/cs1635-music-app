import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/router_constants.dart';
import 'package:test_app/search_constants.dart';
import 'package:test_app/viewmodels/homepage/homepage_view_model.dart';
import 'package:test_app/viewmodels/homepage/post_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';
import 'package:test_app/widgets/common/search_page.dart';
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
        
        body: TabBarView(
          children: <Widget>[
            // Popular
            ChangeNotifierProvider<PostViewModel>(
              child: const PostView(postOrganizeType: PostOrganizeType.popular,),
              create: (_) => PostViewModel()
            ),

            // Following
            ChangeNotifierProvider<PostViewModel>(
              child: const PostView(postOrganizeType: PostOrganizeType.following,),
              create: (_) => PostViewModel()
            ),
          ],
        ),
      ),
    );
  }
}
