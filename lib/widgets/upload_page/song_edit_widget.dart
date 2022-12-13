import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/upload_page/post_upload_view_model.dart';
import 'package:video_player/video_player.dart';

import 'package:test_app/global_styles.dart';
import 'package:test_app/viewmodels/upload_page/song_data_view_model.dart';
import 'package:test_app/widgets/upload_page/post_song_widget.dart';
import 'package:test_app/widgets/upload_page/song_equalizer_widget.dart';
import 'package:test_app/widgets/upload_page/song_trim_widget.dart';

class SongEditWidget extends StatefulWidget {
  const SongEditWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SongEditWidget();
}

class _SongEditWidget extends State<SongEditWidget> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController controller = context.read<SongDataViewModel>().initialize();
    controller.play();
    controller.setLooping(true);

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: controller.initialize(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                controller.pause();
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.navigate_before,
                size: navBarIconSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                controller.pause();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<PostUploadViewModel>(
                      child: const PostSongWidget(),
                      create: (context) => PostUploadViewModel(),
                    ),
                  ),
                );
              },
              heroTag: "Next",
              child: const Icon(
                Icons.navigate_next,
                size: navBarIconSize,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.large(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: () {
                  controller.pause();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<SongDataViewModel>(
                      child: const SongTrimWidget(),
                      create: (context) => SongDataViewModel(),
                    ),
                  ));
                },
                heroTag: "Trim",
                child: const Icon(
                  Icons.content_cut,
                  size: navBarIconSize,
                ),
              ),
              FloatingActionButton.large(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<SongDataViewModel>(
                      child: const SongEqualizerWidget(),
                      create: (context) => SongDataViewModel(),
                    ),
                  ));
                },
                heroTag: "Equalizer",
                child: const Icon(
                  Icons.equalizer,
                  size: navBarIconSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
