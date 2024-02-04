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
                    _buildDetectedObject("heooy"),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDetectedObject(String text) {
    return Positioned(
      top: 16,
      left: 16,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text, // Use the value property of RxString
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
