import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class SongRecordWidget extends StatefulWidget {
  const SongRecordWidget({super.key});

  @override
  State<SongRecordWidget> createState() => _SongRecordState();
}

class _SongRecordState extends State<SongRecordWidget> {

  @override
  Widget build(BuildContext context) {
    return const Text('This is the songRecordWidget page');
  }
}