import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:test_app/global_styles.dart';
import 'package:test_app/viewmodels/upload_page/song_data_view_model.dart';
import 'package:test_app/widgets/upload_page/song_edit_widget.dart';

class SongRecordWidget extends StatefulWidget {
  const SongRecordWidget({super.key});

  @override
  State<SongRecordWidget> createState() => _SongRecordWidget();
}

class _SongRecordWidget extends State<SongRecordWidget> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController controller = context.read<SongDataViewModel>().initialize();

    Icon record = const Icon(
      Icons.fiber_manual_record_outlined,
      size: 90,
    );

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
                controller.dispose();
                Navigator.pop(context);
              },
              heroTag: "Go Back",
              child: const Icon(
                Icons.arrow_back,
                size: navBarIconSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              heroTag: "From Video Library",
              child: const Icon(
                Icons.image,
                size: navBarIconSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                if (!controller.value.isPlaying) {
                  controller.play();
                } else {
                  controller.pause();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider<SongDataViewModel>(
                      child: const SongEditWidget(),
                      create: (context) => SongDataViewModel(),
                    ),
                  ));
                }
              },
              heroTag: "Record",
              child: record,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              heroTag: "Flip Camera",
              child: const Icon(
                Icons.flip_camera_ios_rounded,
                size: navBarIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
