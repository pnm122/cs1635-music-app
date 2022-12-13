import 'package:flutter/material.dart';

import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/upload_page/post_song_widget.dart';
import 'package:test_app/widgets/upload_page/song_trim_widget.dart';

class SongEditWidget extends StatefulWidget {
  const SongEditWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SongEditWidget();
}

class _SongEditWidget extends State<SongEditWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.navigate_before,
              size: navBarIconSize,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostSongWidget(),
              ));
            }, // TODO:
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SongTrimWidget(),
                ));
              }, // TODO:
              child: const Icon(
                Icons.content_cut,
                size: navBarIconSize,
              ),
            ),
            FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {}, // TODO:
              child: const Icon(
                Icons.equalizer,
                size: navBarIconSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
