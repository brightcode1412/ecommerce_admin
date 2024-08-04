import 'dart:typed_data';

import 'package:admin_e_commerce/core/services/firebase_error_handler.dart';
import 'package:admin_e_commerce/core/services/firebase_services.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/web.dart';

class HomeRepo {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseServices firebaseServices = FirebaseServices();

  Future<void> uploadProduct(ProductModel product) async {
    try {
      // get documnet id from the collection
      String documentId = firebaseServices.productsCollection.doc().id;

      await firebaseServices.productsCollection
          .add(product.copyWith(producttId: documentId).toMap());

      Logger().d('Product uploaded to Firestore ${product.toMap()}');
    } on FirebaseException catch (e) {
      Logger().e('Error in uploadProduct: $e');
      throw FirebaseNetworkException.errorHandler(e);
    } catch (e) {
      Logger().e('Error in uploadProduct: $e');
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
      await firestore.collection('images').add({'urls': downloadUrls});
      print('Image URLs added to Firestore');
      return downloadUrls;
    } catch (e) {
      print('Error in uploadImages: $e');
      return [];
    }
  }
}
