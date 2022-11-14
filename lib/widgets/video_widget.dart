import 'package:flutter/material.dart';
// import 'package:test_app/global_styles.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const CustomVideoPlayer({
    required this.videoPlayerController,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late ChewieController
      _chewieController; // IDK if I should use late but it makes the error messages go away!

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 3 / 4,

        // Display first frame of video when loaded
        autoInitialize: true,
        looping: true,
        autoPlay: true,
        showControlsOnInitialize: false,

        // Error message to display if the video isn't working
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.primary),
                const Text("This video is unavailable"),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
