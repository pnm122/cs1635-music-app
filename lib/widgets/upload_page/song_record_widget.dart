import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:test_app/global_styles.dart';

class SongRecordWidget extends StatefulWidget {
  const SongRecordWidget({super.key});

  @override
  State<SongRecordWidget> createState() => _SongRecordState();
}

class _SongRecordState extends State<SongRecordWidget> {
  @override
  Widget build(BuildContext context) {
    const double recButtonSize = 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: const Center(child: Text('This is the songRecordWidget page')), // TODO: write camera code
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_photo,
              size: navBarIconSize,
            ),
            label: 'Select Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_manual_record_outlined,
              size: recButtonSize,
            ),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flip_camera_ios,
              size: navBarIconSize,
            ),
            label: 'Flip Camera',
          ),
        ],
      ),
      backgroundColor: Colors.white, // TODO: Remove this once the camera code is written
    );
  }
}
