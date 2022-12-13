import 'package:flutter/material.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';

class SongTrimWidget extends StatefulWidget {
  const SongTrimWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SongTrimWidget();
}

class _SongTrimWidget extends State<SongTrimWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Trim"),
        actions: [
          IconButton(
            onPressed: () {
              // TODO:
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      // TODO:
    );
  }
}
