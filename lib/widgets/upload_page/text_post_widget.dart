import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';

class TextPostWidget extends StatefulWidget {
  const TextPostWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TextPostState();
}

class _TextPostState extends State<TextPostWidget> {
  late FocusNode foNode;

  @override
  void initState() {
    super.initState();
    foNode = FocusNode();
    foNode.addListener(() {
      if (!foNode.hasFocus) {
        FocusScope.of(context).requestFocus(foNode);
      }
    });
  }

  @override
  void dispose() {
    foNode.dispose();
    super.dispose();
  }

  int textFieldcharLen = 0;
  String content = "";
  _textFieldStats(String value) {
    setState(() {
      textFieldcharLen = value.length;
      content = value;
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
                // Notify user that the post is successfully uploaded
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Posted!')));
                // TODO: Content should appear in user's Post section

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
          focusNode: foNode,
          decoration: const InputDecoration(hintText: "Never gonna give you up 🎵"),
          autofocus: true,
          maxLines: 1,
          minLines: 1,
          maxLength: commentMaxChars,
          onChanged: (String value) => _textFieldStats(value),
        ),
      ),
    );
  }
}
