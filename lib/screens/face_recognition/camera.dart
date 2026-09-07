import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:school_app/models/student.dart';
import 'package:school_app/screens/face_recognition/detector_view.dart';
import 'package:school_app/screens/face_recognition/painter/face_detector_painter.dart';

class CameraFaceDetection extends StatefulWidget {
  // final Student? student;
  const CameraFaceDetection({super.key});

  @override
  State<CameraFaceDetection> createState() => CameraFaceDetectionState();
}

class CameraFaceDetectionState extends State<CameraFaceDetection> {
  final FaceDetector _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
    enableContours: true,
    enableLandmarks: true,
  ));

  bool _hasNavigated = false;
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.front;

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetectorView(
      title: 'Face Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: _processImage,
      onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });

    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null &&
        faces.isNotEmpty) {
      final painter = FaceDetectorPainter(
        faces,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);

      if (!_hasNavigated) {
        _hasNavigated = true;
        Future.delayed(const Duration(seconds: 3), () {
          Get.back();
        });
      }
    } else {
      String text = 'test lah: ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      _text = text;
      _customPaint = null;
    }

    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
