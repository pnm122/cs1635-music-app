import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SongDataViewModel with ChangeNotifier {
  String url = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  late VideoPlayerController controller;
  late Future<void> initializedVideoPlayerFuture;

  Future get future => initializedVideoPlayerFuture;

  VideoPlayerController initialize() {
    controller = VideoPlayerController.network(url);
    initializedVideoPlayerFuture = controller.initialize();
    controller.setVolume(1);
    return controller;
  }
}
