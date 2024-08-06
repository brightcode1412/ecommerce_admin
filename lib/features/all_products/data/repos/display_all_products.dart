import 'package:admin_e_commerce/core/services/firebase_error_handler.dart';
import 'package:admin_e_commerce/core/services/firebase_services.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayAllProductsRepo {
  final FirebaseServices _firebaseServices = FirebaseServices();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseServices.productsCollection.get();
      return querySnapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } on FirebaseException catch (e) {
      throw FirebaseNetworkException.errorHandler(e);
    }
  }
}