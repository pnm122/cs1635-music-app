import 'package:flutter/material.dart';
import 'package:test_app/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';

import '../../global_styles.dart';
import '../../models/text_post.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.post});
  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fill width
      width: double.infinity,
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        color: Theme.of(context).colorScheme.surface,
      ),

      // padding on text posts only
      padding: post is TextPost ? const EdgeInsets.all(postPadding) : const EdgeInsets.all(0),

      child: post is TextPost
        ? Text(post.text,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary))
        : CustomVideoPlayer(
            videoPlayerController: VideoPlayerController.network(post.href),
          ),
    );
  }
}
