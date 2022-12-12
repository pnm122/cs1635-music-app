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
  void initState() {
    startCam();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  late List<CameraDescription> cameras;
  late CameraController cameraController;
  void startCam() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.max,
      enableAudio: true,
    );
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      return; // Error is caught in the code below
    });
  }

  @override
  Widget build(BuildContext context) {
    // Guard camera from the big-angry-red-screen
    if (!cameraController.value.isInitialized) {
      return const Scaffold(
        body: Text("Something is wrong with Camera"),
      );
    }

    return Stack(
      children: [
        Center(child: CameraPreview(cameraController)),
        Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
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
                  size: 100,
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
          backgroundColor: Colors.transparent,
        )
      ],
    );
  }
}
