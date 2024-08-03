import 'package:admin_e_commerce/core/services/failure.dart';
import 'package:admin_e_commerce/core/services/firebase_error_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DeleteImageOrVideoFirestoreRepo {
  Future<void> deleteFileFromFirebase(
      String fileName, String folderName) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    // Check if the current connectivity result is either WiFi or Mobile
    if (!connectivityResult.contains(ConnectivityResult.mobile) &&
        !connectivityResult.contains(ConnectivityResult.wifi)) {
      debugPrint('No internet connection available.');
      throw const Failure(errMsg: 'No internet connection available.');
    } else {
      try {
        String filePath = '$folderName/$fileName';
        final storageRef = FirebaseStorage.instance.ref().child(filePath);
        await storageRef.delete();
        debugPrint('File deleted successfully!');
      } on FirebaseException catch (e) {
        throw FirebaseNetworkException.errorHandler(e);
      }
    }
  }

  Future<void> deleteImageFromFirebase(String imageOrVedioUrl) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    // Check if the current connectivity result is either WiFi or Mobile
    if (!connectivityResult.contains(ConnectivityResult.mobile) &&
        !connectivityResult.contains(ConnectivityResult.wifi)) {
      print('No WiFi or mobile data connection available.');
      debugPrint('No internet connection available.');
      throw const Failure(errMsg: 'No internet connection available.');
    } else {
      try {
        String filePath = extractFilePath(imageOrVedioUrl);

        final storageRef = FirebaseStorage.instance.ref().child(filePath);

        await storageRef.delete();
        debugPrint('Image deleted successfully! yyyyyyyyyyyyyyyes');
      } on FirebaseException catch (e) {
        throw FirebaseNetworkException.errorHandler(e);
      }
    }
  }

  String extractFilePath(String imageUrl) {
    try {
      Uri url = Uri.parse(imageUrl);
      String pathSegment =
          url.pathSegments.firstWhere((segment) => segment.contains('o'));
      if (pathSegment.isNotEmpty) {
        int startIndex = imageUrl.indexOf('/o/') + 3;
        String encodedPath = imageUrl.substring(startIndex);
        int queryIndex = encodedPath.indexOf('?');
        if (queryIndex != -1) {
          encodedPath = encodedPath.substring(0, queryIndex);
        }
        String filePath = Uri.decodeComponent(encodedPath);
        return filePath;
      } else {
        throw Exception('File path segment not found in URL');
      }
    } on FirebaseException catch (e) {
      throw FirebaseNetworkException.errorHandler(e);
    }
  }
}
