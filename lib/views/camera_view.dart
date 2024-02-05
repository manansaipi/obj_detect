import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:obj_detect/controller/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? Stack(
                  children: [
                    CameraPreview(controller.cameraController),
                    _buildDetectedObject(controller.detectionResult),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDetectedObject(List<Map<String, dynamic>> detectionResult) {
    if (detectionResult.isEmpty || detectionResult[0] == null) {
      // Return an empty container or some placeholder widget if detectionResult is empty or its first element is null
      return Container();
    }

    // Extracting box coordinates
    List<double> box = detectionResult[0]['box'].cast<double>();
    double x1 = box[0];
    double y1 = box[1];
    double x2 = box[2];
    double y2 = box[3];
    double confidence = box[4];

    // Extracting tag
    String tag = detectionResult[0]['tag'];
    String tag_confidence =
        '$tag - Confidence: ${confidence.toStringAsFixed(2)}'; // Format confidence as a string

    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          tag_confidence,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
