import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/homepage/post_content_widget.dart';
import 'package:test_app/widgets/homepage/post_interaction_bar.dart';
import 'package:test_app/widgets/homepage/poster_info_widget.dart';
// import 'package:video_player/video_player.dart';
// import 'package:test_app/widgets/video_widget.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/homepage/homepage_view_model.dart';

class PostView extends StatefulWidget {
  final bool isPopularPosts;
  const PostView({super.key, required this.isPopularPosts});
  @override
  State<PostView> createState() => _PostViewState(isPopularPosts);
}

class _PostViewState extends State<PostView> {
  _PostViewState(this.isPopularPosts);
  final bool isPopularPosts;

  @override
  Widget build(BuildContext context) {
    final postList = isPopularPosts ? context.watch<HomepageViewModel>().popularPosts : context.watch<HomepageViewModel>().followingPosts;

    return ListView.builder(
        // padding around the entire list
        padding: const EdgeInsets.all(sectionPadding),
        itemCount: postList.length,
        itemBuilder: (context, i) {
          // Text Post
          // TODO: Turn this into its own widget
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Poster
              PosterInfo(
                post: postList[i],
              ),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Content (Text Post)
              PostContent(
                post: postList[i],
              ),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Interaction icons
              PostInteraction(
                post: postList[i],
              ),

              // extra space between each post
              const SizedBox(height: postGap),
            ],
          );
        });
  }
}
