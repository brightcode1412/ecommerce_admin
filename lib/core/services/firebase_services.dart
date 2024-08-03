import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
// get user collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference getFavouriteCollection(String userId) {
    return userCollection.doc(userId).collection('favourite');
  }

  final CollectionReference adsCollection =
      FirebaseFirestore.instance.collection('ads');

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  // final CollectionReference enrolledCoursesCollection =
  //     FirebaseFirestore.instance.collection('enrolled_courses');

  // CollectionReference materialCollection(String courseId) {
  //   return FirebaseFirestore.instance
  //       .collection('courses')
  //       .doc(courseId)
  //       .collection('material');
  // }

  // Future<List<DocumentSnapshot>> getCourseMaterial(String courseId) async {
  //   try {
  //     // Fetch the specific course document
  //     DocumentSnapshot courseDocument =
  //         await coursesCollection.doc(courseId).get();

  //     if (!courseDocument.exists) {
  //       throw Exception("Course not found");
  //     }

  //     // Query the material subcollection for the specific course
  //     QuerySnapshot materialSnapshot = await courseDocument.reference
  //         .collection('material')
  //         .orderBy('createdAt', descending: false)
  //         .get();

  //     // Extract and return the material documents
  //     return materialSnapshot.docs;
  //   } catch (e) {
  //     // Handle errors or exceptions
  //     debugPrint("Error fetching course material: $e");
  //     return [];
  //   }
  // }
}
