import 'package:admin_e_commerce/core/services/firebase_error_handler.dart';
import 'package:admin_e_commerce/core/services/firebase_services.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DisplayAllProductsRepo {
  final FirebaseServices _firebaseServices = FirebaseServices();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await _firebaseServices.productsCollection.get();
      return querySnapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } on FirebaseException catch (e) {
      throw FirebaseNetworkException.errorHandler(e);
    }
  }

Future<void> deleteProduct(String productId, List<String> imageUrls) async {
  try {
    // Delete the product document from Firestore
    await _firebaseServices.productsCollection.doc(productId).delete();

    // Delete each image from Firebase Storage
    for (String imageUrl in imageUrls) {
      String filePath = extractFilePath(imageUrl);
      final storageRef = FirebaseStorage.instance.ref().child(filePath);
      await storageRef.delete();
    }
  } on FirebaseException catch (e) {
    throw FirebaseNetworkException.errorHandler(e);
  }
}

String extractFilePath(String imageUrl) {
  try {
    Uri url = Uri.parse(imageUrl);
    String pathSegment =
        url.pathSegments.firstWhere((segment) => segment.contains('o'));
    if (pathSegment.isNotEmpty) {
      int startIndex = imageUrl.indexOf('/o/') + 3;
      return imageUrl.substring(startIndex);
    }
  } catch (e) {
    throw Exception('Invalid image URL');
  }
  return '';
}
}
