import 'package:flutter/material.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';

class SongEqualizerWidget extends StatefulWidget {
  const SongEqualizerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SongEqualizerWidget();
}

class _SongEqualizerWidget extends State<SongEqualizerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Equalizer"),
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
