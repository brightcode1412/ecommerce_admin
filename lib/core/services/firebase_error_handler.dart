import 'package:admin_e_commerce/core/services/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseNetworkException {
  factory FirebaseNetworkException.errorHandler(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        throw const Failure(errMsg: "Permission denied");
      case 'unauthenticated':
        throw const Failure(errMsg: "Unauthenticated");
      case 'not-found':
        throw const Failure(errMsg: "not found");
      case 'already-exists':
        throw const Failure(errMsg: "already exists");
      case 'unavailable':
        throw const Failure(errMsg: "Service unavailable");
      case 'aborted':
        throw const Failure(errMsg: "Operation aborted");
      case 'user-not-found':
        throw const Failure(errMsg: "User not found");
      case 'wrong-password':
        throw const Failure(errMsg: "Wrong password");
      case 'network-request-failed':
        throw const Failure(errMsg: "Network error");
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        throw const Failure(errMsg: "Unauthenticated");

      case 'The password is invalid or the user does not have a password.':
        throw const Failure(errMsg: "Wrong password");

      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        throw const Failure(errMsg: "Network error");

      default:
        throw Failure(errMsg: error.message ?? "An unknown error occurred");
    }
  }
  factory FirebaseNetworkException.authErrorHandler(
      FirebaseAuthException error) {
    switch (error.code) {
      case 'user-disabled':
        throw const Failure(errMsg: "User has been disabled.");
      case 'user-not-found':
        throw const Failure(errMsg: "User not found.");
      case 'wrong-password':
        throw const Failure(errMsg: "Wrong password provided.");
      case 'email-already-in-use':
        throw const Failure(errMsg: "Email is already in use.");
      case 'invalid-email':
        throw const Failure(errMsg: "Email address is invalid.");
      case 'operation-not-allowed':
        throw const Failure(errMsg: "Operation not allowed.");
      case 'weak-password':
        throw const Failure(errMsg: "Password is too weak.");
      case 'invalid-credential':
        throw const Failure(errMsg: "email is invalid or password is wrong");
      case 'network-request-failed':
        throw const Failure(errMsg: "Network error");
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        throw const Failure(errMsg: "Unauthenticated");

      case 'The password is invalid or the user does not have a password.':
        throw const Failure(errMsg: "Wrong password");

      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        throw const Failure(errMsg: "Network error");

      default:
        throw const Failure(errMsg: "An undefined Error happened.");
    }
  }
}
