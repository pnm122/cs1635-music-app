import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';

import '../global_styles.dart';
import '../models/post.dart';
import '../models/text_post.dart';

class PostContent extends StatelessWidget {
  PostContent({required this.post});
  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(postPadding),
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        color: Theme.of(context).colorScheme.surface,
      ),

      // TODO: Decide post style based on where we're pulling post info from
      child: post is TextPost ? Text(
          post.text,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary)
      ) : CustomVideoPlayer(
        videoPlayerController: VideoPlayerController.network(post.href),
      ),
    );
  }
}