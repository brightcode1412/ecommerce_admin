import 'package:admin_e_commerce/core/services/firebase_services.dart';

class EditProductRepo{

  final FirebaseServices _firebaseServices = FirebaseServices();


  Future<void> editProduct(String productId, Map<String, dynamic> updatedData) async {
    try {
      await _firebaseServices.productsCollection
          .doc(productId)
          .update(updatedData);
    } catch (e) {
    //  print('Error updating product: $e');
      rethrow;
    }
  }

}