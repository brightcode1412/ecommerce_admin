// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:edu_app/core/services/failure.dart';
// import 'package:flutter/material.dart';

// class CheckInternetConnection {
//  static   Future<void> ensureInternetConnection() async {
//     final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

//     if (!connectivityResult.contains(ConnectivityResult.mobile) &&
//         !connectivityResult.contains(ConnectivityResult.wifi)) {
//       print('No WiFi or mobile data connection available.');
//       debugPrint('No internet connection available.');
//       throw const Failure(errMsg: 'No internet connection available.');
//     }
//   }
// }