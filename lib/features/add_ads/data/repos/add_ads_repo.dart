import 'dart:typed_data';

import 'package:admin_e_commerce/core/services/firebase_error_handler.dart';
import 'package:admin_e_commerce/core/services/firebase_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/web.dart';

class AddAdsRepo {
  final FirebaseServices _firebaseServices = FirebaseServices();

  final FirebaseStorage storage = FirebaseStorage.instance;

  uploadAdsImage(List<String> imagesUrl) async {
    try {
      _firebaseServices.adsCollection.doc().update({
        'image': imagesUrl,
      });
    } on FirebaseException catch (e) {
      Logger().e('Error in uploadProduct: $e');
      throw FirebaseNetworkException.errorHandler(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Uint8List>> pickImages() async {
    // Pick files
    List<Uint8List> images = [];

    final result = await FilePicker.platform
        .pickFiles(allowMultiple: true, withData: true);
    if (result != null) {
      images = result.files.map((file) => file.bytes!).toList();
    }
    return images;
  }

  Future<List<String>> uploadImages(
      List<Uint8List> images, Function(double) onProgress) async {
    try {
      List<String> downloadUrls = [];
      int totalBytes = images.fold(0, (sum, image) => sum + image.length);
      int bytesTransferred = 0;

      for (var image in images) {
        final ref = storage
            .ref()
            .child('uploads/${DateTime.now().millisecondsSinceEpoch}.png');
        final uploadTask = ref.putData(image);

        uploadTask.snapshotEvents.listen((event) {
          if (event.state == TaskState.running) {
            bytesTransferred += event.bytesTransferred;
            final progress = (bytesTransferred / totalBytes) * 100;
            onProgress(progress.toDouble());
          }
        });

        await uploadTask;
        final downloadUrl = await ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
        print('Download URL: $downloadUrl');
      }
      return downloadUrls;
    } catch (e) {
      print('Error in uploadImages: $e');
      return [];
    }
  }
}
