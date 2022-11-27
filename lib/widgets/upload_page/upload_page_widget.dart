import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/homepage/post_view_model.dart';
import 'package:test_app/viewmodels/upload_page/song_record_view_model.dart';
import 'package:test_app/viewmodels/upload_page/text_post_view_model.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              // TODO: Go to SongRecord
            }, icon: const Icon(Icons.music_video)),
            const Text('Song'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              // TODO: Go to TextPost
              ChangeNotifierProvider(
                create: (_) => PostViewModel(),
              );
            }, icon: const Icon(Icons.chat_bubble_outline_sharp)),
            const Text('Text'),
          ],
        ),
      ],
    );
  }
}
