import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';

import '../global_styles.dart';

class PostContent extends StatelessWidget {
  PostContent({required this.i});
  final int i;

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
      child: (i/2).floor().isOdd ? Text(
          "nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary)
      ) : CustomVideoPlayer(
        videoPlayerController: VideoPlayerController.network("https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761"),
      ),
    );
  }
}