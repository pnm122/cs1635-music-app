import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'package:test_app/viewmodels/upload_page/song_data_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';

class SongEqualizerWidget extends StatefulWidget {
  const SongEqualizerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SongEqualizerWidget();
}

class _SongEqualizerWidget extends State<SongEqualizerWidget> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController controller = context.read<SongDataViewModel>().initialize();
    controller.play();
    controller.setLooping(true);

    Color foreground = Theme.of(context).colorScheme.primary;
    const Size cmnMinSize = Size(150, 90);
    const double outlineWidth = 3.5;
    BorderSide btnOutline = BorderSide(width: outlineWidth, color: foreground);
    Color background = Theme.of(context).colorScheme.background;
    double buttonFontSize = 30;

    ButtonStyle cmnStyle = ElevatedButton.styleFrom(
      backgroundColor: background,
      minimumSize: cmnMinSize,
      side: btnOutline,
    );
    TextStyle cmnTS = TextStyle(
      color: foreground,
      fontSize: buttonFontSize,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Equalizer"),
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: cmnStyle,
                    child: Text(
                      "Bass\n Boost",
                      style: cmnTS,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: cmnStyle,
                    child: Text(
                      "Tremble\n Boost",
                      style: cmnTS,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
