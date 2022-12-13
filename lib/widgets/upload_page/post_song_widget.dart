import 'package:flutter/material.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';

class PostSongWidget extends StatefulWidget {
  const PostSongWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PostSongWidget();
}

class _PostSongWidget extends State<PostSongWidget> {
  bool isCover = true;
  bool isOriginal = false;

  @override
  Widget build(BuildContext context) {
    EdgeInsets cmnTextFieldWidthLimit = EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05);

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Post Song"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO:
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("This song is a ..."),
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
              maxLines: 1,
              minLines: 1,
              onChanged: (String value) => null, // TODO:
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
              maxLines: 1,
              minLines: 1,
              onChanged: (String value) => null, // TODO:
            ),
          ),
        ],
      ),
    );
  }
}
