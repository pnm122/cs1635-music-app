import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/upload_page/song_edit_widget.dart';

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
    camController.dispose();
    super.dispose();
  }

  late List<CameraDescription> cameras;
  late CameraController camController;
  void startCam() async {
    cameras = await availableCameras();

    camController = CameraController(
      cameras.first,
      ResolutionPreset.max,
    );
    await camController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((e) {
      print(e); // Error is caught in the code below
    });
  }

  bool isFrontCam = false;
  @override
  Widget build(BuildContext context) {
    // Guard camera from the big-angry-red-screen
    if (!camController.value.isInitialized) {
      return const Center(
        child: Icon(
          Icons.refresh,
          size: 200,
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CameraPreview(camController),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                Navigator.pop(context);
              },
              heroTag: "Go Back",
              child: const Icon(
                Icons.arrow_back,
                size: navBarIconSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {}, // TODO:
              heroTag: "From Video Library",
              child: const Icon(
                Icons.image,
                size: navBarIconSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SongEditWidget(),
                ));
              }, // TODO:
              heroTag: "Record",
              child: const Icon(
                Icons.fiber_manual_record_outlined,
                size: 90,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () async {
                setState(() {
                  isFrontCam = !isFrontCam;
                });
                int camPos = isFrontCam ? 0 : 1;
                camController = CameraController(
                  cameras[camPos],
                  ResolutionPreset.max,
                );
                await camController.initialize().then((_) {
                  if (!mounted) return;
                  setState(() {});
                }).catchError((e) {
                  print(e);
                });
              },
              heroTag: "Flip Camera",
              child: const Icon(
                Icons.flip_camera_ios_rounded,
                size: navBarIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
