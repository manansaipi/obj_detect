import 'package:flutter/material.dart';

class BoundingBoxPainter extends CustomPainter {
  final List<Map<String, dynamic>> detectionResult;

  BoundingBoxPainter(this.detectionResult);

  @override
  void paint(Canvas canvas, Size size) {
    if (detectionResult.isEmpty || detectionResult[0] == null) {
      return; // No detection result or null result, do nothing
    }

    List<double> box = detectionResult[0]['box'].cast<double>();
    double x1 = box[0];
    double y1 = box[1];
    double x2 = box[2];
    double y2 = box[3];

    Paint paint = Paint()
      ..color = Colors.red // Color of the bounding box
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(Rect.fromLTRB(x1, y1, x2, y2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Always repaint when the detection result changes
  }
}

class DetectedObjectWidget extends StatelessWidget {
  final List<Map<String, dynamic>> detectionResult;

  DetectedObjectWidget(this.detectionResult);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: BoundingBoxPainter(detectionResult),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${detectionResult[0]['tag']} - Confidence: ${detectionResult[0]['box'][4].toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
