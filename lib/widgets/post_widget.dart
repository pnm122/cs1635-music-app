import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/post_content_widget.dart';
import 'package:test_app/widgets/post_interaction_bar.dart';
import 'package:test_app/widgets/poster_info_widget.dart';
// import 'package:video_player/video_player.dart';
// import 'package:test_app/widgets/video_widget.dart';
import 'package:provider/provider.dart';

import '../viewmodels/homepage_view_model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    final postList = context.watch<HomepageViewModel>().popularPosts;

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
