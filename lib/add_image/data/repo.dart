// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ImageRepository {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<void> uploadImages(List<Uint8List> images) async {
//     try {
//       List<String> downloadUrls = [];
//       for (var image in images) {
//         final ref = storage
//             .ref()
//             .child('uploads/${DateTime.now().millisecondsSinceEpoch}.png');
//         await ref.putData(image);
//         final downloadUrl = await ref.getDownloadURL();
//         downloadUrls.add(downloadUrl);
//         print('Download URL: $downloadUrl');
//       }
//       await firestore.collection('images').add({'urls': downloadUrls});
//       print('Image URLs added to Firestore');
//     } catch (e) {
//       print('Error in uploadImages: $e');
//     }
//   }
// }

// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ImageRepository {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<List<String>> uploadImages(List<Uint8List> images) async {
//     try {
//       List<String> downloadUrls = [];
//       for (var image in images) {
//         final ref = storage
//             .ref()
//             .child('uploads/${DateTime.now().millisecondsSinceEpoch}.png');
//         await ref.putData(image);
//         final downloadUrl = await ref.getDownloadURL();
//         downloadUrls.add(downloadUrl);
//         print('Download URL: $downloadUrl');
//       }
//       await firestore.collection('images').add({'urls': downloadUrls});
//       print('Image URLs added to Firestore');
//       return downloadUrls;
//     } catch (e) {
//       print('Error in uploadImages: $e');
//       return [];
//     }
//   }
// }

// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ImageRepository {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<List<String>> uploadImages(List<Uint8List> images, Function(int) onProgress) async {
//     try {
//       List<String> downloadUrls = [];
//       for (var image in images) {
//         final ref = storage
//             .ref()
//             .child('uploads/${DateTime.now().millisecondsSinceEpoch}.png');
//         final uploadTask = ref.putData(image);

//         uploadTask.snapshotEvents.listen((event) {
//           final progress = (event.bytesTransferred / event.totalBytes) * 100;
//           onProgress(progress.toInt());
//         });

//         await uploadTask;
//         final downloadUrl = await ref.getDownloadURL();
//         downloadUrls.add(downloadUrl);
//         print('Download URL: $downloadUrl');
//       }
//       await firestore.collection('images').add({'urls': downloadUrls});
//       print('Image URLs added to Firestore');
//       return downloadUrls;
//     } catch (e) {
//       print('Error in uploadImages: $e');
//       return [];
//     }
//   }
// }

// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ImageRepository {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<List<String>> uploadImages(List<Uint8List> images, Function(int) onProgress) async {
//     try {
//       List<String> downloadUrls = [];
//       int totalBytes = images.fold(0, (sum, image) => sum + image.length);
//       int bytesTransferred = 0;

//       for (var image in images) {
//         final ref = storage
//             .ref()
//             .child('uploads/${DateTime.now().millisecondsSinceEpoch}.png');
//         final uploadTask = ref.putData(image);

//         uploadTask.snapshotEvents.listen((event) {
//           bytesTransferred += event.bytesTransferred;
//           final progress = (bytesTransferred / totalBytes) * 100;
//           onProgress(progress.toInt());
//         });

//         await uploadTask;
//         final downloadUrl = await ref.getDownloadURL();
//         downloadUrls.add(downloadUrl);
//         print('Download URL: $downloadUrl');
//       }
//       await firestore.collection('images').add({'urls': downloadUrls});
//       print('Image URLs added to Firestore');
//       return downloadUrls;
//     } catch (e) {
//       print('Error in uploadImages: $e');
//       return [];
//     }
//   }
// }

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<String>> uploadImages(
      List<Uint8List> images, Function(int) onProgress) async {
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
            onProgress(progress.toInt());
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
