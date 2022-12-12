import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:test_app/global_styles.dart';

class SongRecordWidget extends StatefulWidget {
  const SongRecordWidget({super.key});

  @override
  State<SongRecordWidget> createState() => _SongRecordState();
}

late List<CameraDescription> _cameras;

class _SongRecordState extends State<SongRecordWidget> {
  late CameraController camCtrlr;
  late bool _ready;

  @override
  void initState() {
    super.initState();
    _ready = false;
    initCam();
    camCtrlr = CameraController(_cameras[0], ResolutionPreset.max);
    camCtrlr.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> initCam() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    _ready = true;
  }

  @override
  void dispose() {
    camCtrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Wait until camera is ready
    if (!_ready) {
      return const CircularProgressIndicator();
    }

    const double recButtonSize = 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: CameraPreview(camCtrlr)),
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
    );
  }
}
