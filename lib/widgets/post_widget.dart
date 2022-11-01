import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/post_content_widget.dart';
import 'package:test_app/widgets/post_interaction_bar.dart';
import 'package:test_app/widgets/poster_info_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:test_app/widgets/video_widget.dart';

class PostView extends StatefulWidget {
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding around the entire list
        padding: const EdgeInsets.all(sectionPadding),

        itemBuilder: (context, i) {
          // extra space between each post
          if(i.isOdd) return const SizedBox(height:postGap);

          // Text Post
          // TODO: Turn this into its own widget
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Poster
              PosterInfo(),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Content (Text Post)
              PostContent(i: i,),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Interaction icons
              PostInteraction(),
            ],
          );
        }
    );
  }
}