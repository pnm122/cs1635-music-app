import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/upload_page/song_record_view_model.dart';
import 'package:test_app/viewmodels/upload_page/text_post_view_model.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color foreground = Theme.of(context).colorScheme.primary;
    Color background = Theme.of(context).colorScheme.background;
    const double iconSize = 70;
    const double fontSize = 20;
    const double outlineWidth = 3;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Go to SongRecord
              ChangeNotifierProvider(
                create: (_) => SongRecordViewModel(),
              );
            },
            icon: Icon(
              Icons.music_video,
              size: iconSize,
              color: foreground,
            ),
            label: Text(
              'Song',
              style: TextStyle(
                color: foreground,
                fontSize: fontSize,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: background,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              side: BorderSide(
                width: outlineWidth,
                color: foreground,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Go to TextPost
              ChangeNotifierProvider(
                create: (_) => TextPostViewModel(),
              );
            },
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
              size: iconSize,
              color: foreground,
            ),
            label: Text(
              'Text',
              style: TextStyle(
                color: foreground,
                fontSize: fontSize,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: background,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              side: BorderSide(
                width: outlineWidth,
                color: foreground,
              ),
            ),
          )
        ],
      ),
    );
  }
}
