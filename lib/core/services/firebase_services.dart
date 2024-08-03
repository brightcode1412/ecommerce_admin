import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference getFavouriteCollection(String userId) {
    return userCollection.doc(userId).collection('favourite');
  }

  final CollectionReference adsCollection =
      FirebaseFirestore.instance.collection('ads');

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');
}
