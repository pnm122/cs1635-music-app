import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

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
    rearCamera.dispose();
    frontCamera.dispose();
    super.dispose();
  }

  late List<CameraDescription> cameras;
  late CameraController rearCamera;
  late CameraController frontCamera;
  void startCam() async {
    cameras = await availableCameras();

    rearCamera = CameraController(
      cameras.first,
      ResolutionPreset.max,
      enableAudio: true,
    );
    await rearCamera.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    }).catchError((e) {
      return; // Error is caught in the code below
    });
    rearCamera.lockCaptureOrientation(DeviceOrientation.portraitUp);

    frontCamera = CameraController(
      cameras.last,
      ResolutionPreset.max,
      enableAudio: true,
    );
    await frontCamera.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    }).catchError((e) {
      return;
    });
    // For some reason, the webcam is in the wrong orientation by
    frontCamera.lockCaptureOrientation(DeviceOrientation.landscapeRight);
  }

  @override
  Widget build(BuildContext context) {
    // Guard camera from the big-angry-red-screen
    if (!rearCamera.value.isInitialized || !frontCamera.value.isInitialized) {
      return const Center(
        child: Icon(
          Icons.refresh,
          size: 200,
        ),
      );
    }

    return Stack(
      children: [
        Center(
          child: CameraPreview(rearCamera),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: navBarIconSize,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {}, // TODO:
            child: const Icon(
              Icons.image,
              size: navBarIconSize,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {}, // TODO:
            child: const Icon(
              Icons.fiber_manual_record_outlined,
              size: 90,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {}, // TODO:
            child: const Icon(
              Icons.flip_camera_ios_rounded,
              size: navBarIconSize,
            ),
          ),
        ),
      ],
    );
  }
}
