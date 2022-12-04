import 'package:flutter/material.dart';
import 'package:test_app/models/text_post.dart';
import 'package:test_app/global_styles.dart';

class TextPostWidget extends StatefulWidget {
  const TextPostWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TextPostState();
}

class _TextPostState extends State<TextPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share your thoughts'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hey, it worked!')));
            },
            icon: const Icon(Icons.send),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: const TextField(
        maxLines: null,
        minLines: null,
        maxLength: commentMaxChars,
      ),
    );
  }
}
