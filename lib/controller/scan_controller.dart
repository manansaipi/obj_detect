import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initCamera();
    initTFLite();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  FlutterVision vision = FlutterVision();

  late CameraController cameraController;
  late List<CameraDescription> cameras;
  var detectedObject = "".obs;
  List<Map<String, dynamic>> detectionResult = [
    {
      "box": [
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
      ],
      "tag": ""
      // "polygons": List<Map<String, double>>: [{x:coordx, y:coordy}]
    }
  ];
  var cameraCount = 0;

  var isCameraInitialized = false.obs;

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();

      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      // await cameraController.initialize();
      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      print("Permission denied");
    }
  }

  initTFLite() async {
    print("LOAD THE MODEL !");

    // await Tflite.loadModel(
    //     model: "assets/model/yolov8l_float16.tflite",
    //     labels: "assets/model/mylabels.txt",
    //     numThreads: 1, // defaults to 1
    //     isAsset:
    //         true, // defaults to true, set to false to load resources outside assets
    //     useGpuDelegate:
    //         false // defaults to false, set to true to use GPU delegate
    //     );

    //flutter vision
    await vision.loadYoloModel(
      modelPath: 'assets/model/mymodel.tflite',
      labels: 'assets/model/mylabels.txt',
      modelVersion: "yolov8",
      quantization: true,
      numThreads: 1,
      useGpu: true,
    );
    print("MODEL LOAD SUCCESSFULLY");
  }

  objectDetector(CameraImage image) async {
    // run on an image
    // var detector = await Tflite.detectObjectOnImage(
    //     path: "assets/images/zidane.jpg", // required
    //     model: "YOLO",
    //     imageMean: 0.0,
    //     imageStd: 255.0,
    //     threshold: 0.3, // defaults to 0.1
    //     numResultsPerClass: 2, // defaults to 5
    //     blockSize: 32, // defaults to 32
    //     numBoxesPerBlock: 5, // defaults to 5
    //     asynch: true // defaults to true
    //     );

    // print("HEYOO IM HERE $detector");

    // run on videostream

//fkutter_tflite
    // var result = await Tflite.runModelOnFrame(
    //     bytesList: image.planes.map((plane) {
    //       return plane.bytes;
    //     }).toList(), // required
    //     imageHeight: image.height,
    //     imageWidth: image.width,
    //     imageMean: 127.5, // defaults to 127.5
    //     imageStd: 127.5, // defaults to 127.5
    //     rotation: 90, // defaults to 90, Android only
    //     numResults: 2, // defaults to 5
    //     threshold: 0.1, // defaults to 0.1
    //     asynch: true // defaults to true
    //     );
    // print("RESULTTTTTTTTTTTTTTTT:");
    // print(result);
    //example result
    // [{box: [0.0, 763.1640625, 357.9225158691406, 1116.581787109375, 0.5627957582473755], tag: Stop}]
    // flutter vision
    var result = await vision.yoloOnFrame(
      bytesList: image.planes.map((plane) => plane.bytes).toList(),
      imageHeight: image.height,
      imageWidth: image.width,
      iouThreshold: 0.4,
      confThreshold: 0.4,
      classThreshold: 0.5,
    );
    if (result.isNotEmpty) {
      print("RESULTTTTTTTTTTTTTTTT:");
      print(result);

      detectionResult = result;
    } else {
      detectionResult = [
        {
          "box": [
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
          ],
          "tag": "No Object"
        }
      ];
    }
    // if (detector != null && detector.isNotEmpty) {
    //   var firstDetectedObject = detector.first;
    //   var detectedString =

    //       '${firstDetectedObject['detectedClass']} - Confidence: ${firstDetectedObject['confidence']}';
    //   detectedObject.value = detectedString;
    //   print("Result is $detectedString");
    // } else {
    //   detectedObject.value = 'No object detected';
    //   print("No object detected");
    // }
  }
}
