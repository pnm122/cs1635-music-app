import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';

class TextPostWidget extends StatefulWidget {
  const TextPostWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TextPostState();
}

class _TextPostState extends State<TextPostWidget> {
  int textFieldcharLen = 0;
  _textFieldCharLen(String value) {
    setState(() {
      textFieldcharLen = value.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share your thoughts'),
        actions: [
          IconButton(
            onPressed: () {
              if (textFieldcharLen > 0) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Posted!')));
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.send),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        child: TextField(
          decoration: const InputDecoration(hintText: "Never gonna give you up 🎵"),
          maxLines: null,
          minLines: null,
          maxLength: commentMaxChars,
          onChanged: (value) => _textFieldCharLen(value),
        ),
      ),
    );
  }
}
