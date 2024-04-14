import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/models/User.dart';
import 'package:ecommerce_app/data/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:ecommerce_app/data/repositories/database_repository/firebase_database_repository.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/validators/validation.dart';

class SignUpController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isButtonEnabled = true.obs;
  Rx<bool> obsecureText = true.obs;
  Rx<String> countryCode  = "+91".obs;

  setLoading(bool value) {
    isLoading.value = value;
  }

  setButtonEnabled(bool value) {
    isButtonEnabled.value = value;
  }

  showLoadingDialog() {
    return Get.dialog(Center(
      child: Lottie.asset(TImages.loadingAnim, width: 90, height: 90),
    ));
  }

  AuthRepository repository = AuthRepository();
  DatabaseRepository dbRepository = DatabaseRepository();

  Future<dynamic> registerUser(String email, String password, String? phoneNumber, String? firstName, [String? lastName]) async {
    String? emailErrorString = TValidator.validateEmail(email);
    String? passErrorString = TValidator.validatePassword(password);
    String? firstErrorString = TValidator.validateName(firstName);
    String phoneNumberWithCode = countryCode + "$phoneNumber";
    print(countryCode);
    print("priniting phone number $phoneNumberWithCode");
    String? phoneErrorString = TValidator.validateMobile(phoneNumberWithCode);
    if(firstErrorString != null){
      Get.snackbar("Error!", firstErrorString,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (emailErrorString != null) {
      Get.snackbar("Error!", emailErrorString,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (passErrorString != null) {
      Get.snackbar("Error!", passErrorString,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if(lastName != null && lastName.isNotEmpty){
      String? lastNameErrorString = TValidator.validateLastName(lastName);
      if(lastNameErrorString != null){
        Get.snackbar("Error!", lastNameErrorString,
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }
    }
    if(phoneErrorString != null){
      Get.snackbar("Error!", phoneErrorString,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    setLoading(true);
    setButtonEnabled(false);
    showLoadingDialog();
    FirebaseFirestore db = FirebaseFirestore.instance;
    repository.registerUserWithFirebase(email, password).whenComplete(() async {
      User? user = FirebaseAuth.instance.currentUser;
      UserModel userModel = UserModel(id: user!.uid, firstName: firstName!, lastName: lastName!, phone: phoneNumberWithCode, email: email);
       await db.collection("users").add(userModel.toJson()).whenComplete(() {
        setLoading(false);
        Navigator.of(Get.overlayContext!).pop();
        Get.snackbar("Success!", "Account created successfully...",
            colorText: Colors.green,
            backgroundColor: Colors.green.withOpacity(0.1));
      }).catchError((error, stackTrace) {
        setLoading(false);
        Navigator.of(Get.overlayContext!).pop();
        Get.snackbar("Error!", error.toString(),
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red);
        setButtonEnabled(true);
      });
    }).catchError((error, stackTrace) {
      setLoading(false);
      Navigator.of(Get.overlayContext!).pop();
      Get.snackbar("Error!", error.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      setButtonEnabled(true);
    });
  }
}
