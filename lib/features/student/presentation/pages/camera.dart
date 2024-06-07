import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/style.dart';

late List<CameraDescription> _cameras;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    setState(() {
      _cameras = cameras;
      controller = CameraController(_cameras[1], ResolutionPreset.max,
          enableAudio: false);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: CameraPreview(controller),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black40.withOpacity(.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(4)),
          child: Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
