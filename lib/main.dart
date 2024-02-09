import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:obj_detect/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
// {
//     "geocoded_waypoints": [
//         {
//             "geocoder_status": "OK",
//             "place_id": "ChIJHdxX8cuEaS4R0BdYsqXWWv8",
//             "types": [
//                 "street_address"
//             ]
//         },
//         {
//             "geocoder_status": "OK",
//             "place_id": "ChIJ_b8_XsqEaS4Rn1StTWAMgRE",
//             "types": [
//                 "establishment",
//                 "library",
//                 "point_of_interest"
//             ]
//         }
//     ],
//     "routes": [
//         {
//             "bounds": {
//                 "northeast": {
//                     "lat": -6.2833745,
//                     "lng": 107.1706646
//                 },
//                 "southwest": {
//                     "lat": -6.2847519,
//                     "lng": 107.1667512
//                 }
//             },
//             "copyrights": "Map data ©2024",
//             "legs": [
//                 {
//                     "distance": {
//                         "text": "0.6 km",
//                         "value": 570
//                     },
//                     "duration": {
//                         "text": "8 mins",
//                         "value": 471
//                     },
//                     "end_address": "P58C+36R, Jl. Sekolah Hijau, Mekarmukti, Kec. Cikarang Utara, Kabupaten Bekasi, Jawa Barat 17530, Indonesia",
//                     "end_location": {
//                         "lat": -6.2847519,
//                         "lng": 107.1706646
//                     },
//                     "start_address": "Jalan Kampung Dusun Cibeber 1 No.3, RT.2/RW.6, Simpangan, Kec. Cikarang Utara, Kabupaten Bekasi, Jawa Barat 17530, Indonesia",
//                     "start_location": {
//                         "lat": -6.2833745,
//                         "lng": 107.1667512
//                     },
//                     "steps": [
//                         {
//                             "distance": {
//                                 "text": "0.2 km",
//                                 "value": 158
//                             },
//                             "duration": {
//                                 "text": "2 mins",
//                                 "value": 124
//                             },
//                             "end_location": {
//                                 "lat": -6.2840684,
//                                 "lng": 107.1679352
//                             },
//                             "html_instructions": "Head <b>southeast</b> on <b>Jl. Blk. I</b>",
//                             "polyline": {
//                                 "points": "`fje@e_bmSDAB?@C@C@CDK?C@E@GH[?A@E@GDEBC@AJKNKBADCDCDGBCBMJYJa@DQ"
//                             },
//                             "start_location": {
//                                 "lat": -6.2833745,
//                                 "lng": 107.1667512
//                             },
//                             "travel_mode": "WALKING"
//                         },
//                         {
//                             "distance": {
//                                 "text": "48 m",
//                                 "value": 48
//                             },
//                             "duration": {
//                                 "text": "1 min",
//                                 "value": 39
//                             },
//                             "end_location": {
//                                 "lat": -6.284329,
//                                 "lng": 107.1682736
//                             },
//                             "html_instructions": "Continue straight onto <b>Jl. Kp. Dusun Cibeber</b>",
//                             "maneuver": "straight",
//                             "polyline": {
//                                 "points": "ljje@sfbmSBEBIBIDGHKBEDCLI"
//                             },
//                             "start_location": {
//                                 "lat": -6.2840684,
//                                 "lng": 107.1679352
//                             },
//                             "travel_mode": "WALKING"
//                         },
//                         {
//                             "distance": {
//                                 "text": "0.1 km",
//                                 "value": 131
//                             },
//                             "duration": {
//                                 "text": "2 mins",
//                                 "value": 108
//                             },
//                             "end_location": {
//                                 "lat": -6.284383,
//                                 "lng": 107.1693971
//                             },
//                             "html_instructions": "Turn <b>left</b>",
//                             "maneuver": "turn-left",
//                             "polyline": {
//                                 "points": "`lje@uhbmS?K@M@M@M@G@C?A?CA??AA?C?A??AAA@G@K@M@MDODI@EAQAUAOCK"
//                             },
//                             "start_location": {
//                                 "lat": -6.284329,
//                                 "lng": 107.1682736
//                             },
//                             "travel_mode": "WALKING"
//                         },
//                         {
//                             "distance": {
//                                 "text": "84 m",
//                                 "value": 84
//                             },
//                             "duration": {
//                                 "text": "1 min",
//                                 "value": 70
//                             },
//                             "end_location": {
//                                 "lat": -6.2838685,
//                                 "lng": 107.1699339
//                             },
//                             "html_instructions": "Turn <b>left</b> toward <b>Jl. Ki Hajar Dewantara</b>",
//                             "maneuver": "turn-left",
//                             "polyline": {
//                                 "points": "jlje@wobmSCAECEAECGECCCEEIGEIKKKKKOY"
//                             },
//                             "start_location": {
//                                 "lat": -6.284383,
//                                 "lng": 107.1693971
//                             },
//                             "travel_mode": "WALKING"
//                         },
//                         {
//                             "distance": {
//                                 "text": "93 m",
//                                 "value": 93
//                             },
//                             "duration": {
//                                 "text": "1 min",
//                                 "value": 75
//                             },
//                             "end_location": {
//                                 "lat": -6.2843936,
//                                 "lng": 107.1705839
//                             },
//                             "html_instructions": "Turn <b>right</b> onto <b>Jl. Ki Hajar Dewantara</b>",
//                             "maneuver": "turn-right",
//                             "polyline": {
//                                 "points": "dije@asbmS^e@V_@n@{@"
//                             },
//                             "start_location": {
//                                 "lat": -6.2838685,
//                                 "lng": 107.1699339
//                             },
//                             "travel_mode": "WALKING"
//                         },
//                         {
//                             "distance": {
//                                 "text": "26 m",
//                                 "value": 26
//                             },
//                             "duration": {
//                                 "text": "1 min",
//                                 "value": 31
//                             },
//                             "end_location": {
//                                 "lat": -6.2845904,
//                                 "lng": 107.1704527
//                             },
//                             "html_instructions": "Turn <b>right</b> onto <b>Jl. Sekolah Hijau</b>",
//                             "maneuver": "turn-right",
//                             "polyline": {
//                                 "points": "llje@cwbmS^TFB"
//                             },
//                             "start_location": {
//                                 "lat": -6.2843936,
//                                 "lng": 107.1705839
//                             },78
//                             "travel_mode": "WALKING"
//                         },
//                         {
//                             "distance": {
//                                 "text": "30 m",
//                                 "value": 30
//                             },
//                             "duration": {
//                                 "text": "1 min",
//                                 "value": 24
//                             },
//                             "end_location": {
//                                 "lat": -6.2847519,
//                                 "lng": 107.1706646
//                             },
//                             "html_instructions": "Turn <b>left</b> to stay on <b>Jl. Sekolah Hijau</b><div style=\"font-size:0.9em\">Destination will be on the right</div>",
//                             "maneuver": "turn-left",
//                             "polyline": {
//                                 "points": "tmje@ivbmSBCZe@"
//                             },
//                             "start_location": {
//                                 "lat": -6.2845904,
//                                 "lng": 107.1704527
//                             },
//                             "travel_mode": "WALKING"
//                         }
//                     ],
//                     "traffic_speed_entry": [],
//                     "via_waypoint": []
//                 }
//             ],
//             "overview_polyline": {
//                 "points": "`fje@e_bmSHABGHYLk@FMDEd@]JKFQ`@sAVg@HILI?KB[BU@IGAAA@UB[JY?WCe@CKCAKEUSc@g@[e@v@eAn@{@^TFBBCZe@"
//             },
//             "summary": "Jl. Blk. I",
//             "warnings": [
//                 "Walking directions are in beta. Use caution – This route may be missing sidewalks or pedestrian paths."
//             ],
//             "waypoint_order": []
//         }
//     ],
//     "status": "OK"
// }