import 'package:flutter/material.dart';

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
              // TODO: Go to SongEdit
            }, icon: const Icon(Icons.music_video)),
            const Text('Song'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              // TODO: Go to TextPost
            }, icon: const Icon(Icons.chat_bubble_outline_sharp)),
            const Text('Text'),
          ],
        ),
      ],
    );
  }
}
