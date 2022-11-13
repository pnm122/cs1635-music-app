import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';

class Comments extends StatefulWidget {
  const Comments({super.key, required this.post});
  final dynamic post;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }
        ),

        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight:FontWeight.bold),
        ),
      ),
    );
  }
}