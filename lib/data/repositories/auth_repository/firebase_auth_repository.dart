import 'package:ecommerce_app/utils/exception/app_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<dynamic> registerUserWithFirebase(String email,
      String password) async {
    dynamic credential;
    try {
      credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AuthException(e.message);
      } else {
        rethrow;
      }
    }
    return credential;
  }

  Future<dynamic> loginUserWithFirebase(String email, String password) async {
    dynamic credential;
    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
    return credential;
  }

}
