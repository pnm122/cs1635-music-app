import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';
import 'package:test_app/viewmodels/upload_page/post_upload_view_model.dart';

class TextPostUpload extends StatefulWidget {
  const TextPostUpload({super.key});
  @override
  State<StatefulWidget> createState() => _TextPostState();
}

class _TextPostState extends State<TextPostUpload> {
  // Automatic keyboard pop-up
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
      appBar: CustomAppBar(
        title: const Text('Share your thoughts'),
        showBackButton: true,
        actions: [
          IconButton(
            onPressed: () {
              if (textFieldcharLen > 0) {
                context.read<PostUploadViewModel>().addPost(content);

                // Notify user that the post is successfully uploaded
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Posted!')));
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.send),
          )
        ],
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
