import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/upload_page/post_upload_view_model.dart';
import 'package:test_app/viewmodels/upload_page/song_data_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class PostSongWidget extends StatefulWidget {
  const PostSongWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PostSongWidget();
}

class _PostSongWidget extends State<PostSongWidget> {
  bool isCover = true;
  bool isOriginal = false;

  String content = "";
  _textFieldStats(String value) {
    setState(() {
      content = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets cmnTextFieldWidthLimit = EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05);

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Post Song"),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Route with search page
              // Attach Song using search_tiles.dart
              if (isCover) {
                context.read<PostUploadViewModel>().addMedia('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', content);
              } else {
                context.read<PostUploadViewModel>().addOriginal('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', content);
              }
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Posted!')));
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("This song is a ...", style: TextStyle(fontSize: 20)),
          ),
          Row(
            children: [
              Checkbox(
                value: isCover,
                onChanged: (bool? value) {
                  setState(() {
                    isCover = true;
                    isOriginal = false;
                  });
                },
              ),
              const Text("Cover"),
            ],
          ),
          Padding(
            padding: cmnTextFieldWidthLimit,
            child: TextField(
              decoration: const InputDecoration(hintText: "Cover of ..."),
              enabled: isCover,
              maxLines: 1,
              minLines: 1,
              onChanged: (String value) => _textFieldStats(value),
            ),
          ),
          Padding(
            padding: cmnTextFieldWidthLimit,
            child: TextField(
              decoration: const InputDecoration(hintText: "Cover artist"),
              enabled: isCover,
              maxLines: 1,
              minLines: 1,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: isOriginal,
                onChanged: (bool? value) {
                  setState(() {
                    isOriginal = true;
                    isCover = false;
                  });
                },
              ),
              const Text("Original"),
            ],
          ),
          Padding(
            padding: cmnTextFieldWidthLimit,
            child: TextField(
              decoration: const InputDecoration(hintText: "Name your song"),
              enabled: isOriginal,
              maxLines: 1,
              minLines: 1,
              onChanged: (String value) => _textFieldStats(value),
            ),
          ),
        ],
      ),
    );
  }
}
