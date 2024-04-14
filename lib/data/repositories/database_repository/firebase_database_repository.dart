import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/models/User.dart';

class DatabaseRepository {
  final _db = FirebaseFirestore.instance;

  Future<dynamic> saveUserToDatabase(UserModel user) async {
    return _db.collection("users")
        .add(user.toJson());
  }
}
