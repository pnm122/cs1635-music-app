import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:test_app/viewmodels/upload_page/song_data_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';

class SongTrimWidget extends StatefulWidget {
  const SongTrimWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SongTrimWidget();
}

class _SongTrimWidget extends State<SongTrimWidget> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController controller = context.read<SongDataViewModel>().initialize();

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Trim"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
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
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
                Image.asset(
                  "lib/assets/Screenshot 2022-12-13 at 15.35.10.png",
                  height: 50,
                ),
                Image.asset(
                  "lib/assets/Screenshot 2022-12-13 at 15.35.20.png",
                  height: 50,
                ),
                Image.asset(
                  "lib/assets/Screenshot 2022-12-13 at 15.35.25.png",
                  height: 50,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
