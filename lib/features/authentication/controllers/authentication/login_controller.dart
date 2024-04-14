import 'package:ecommerce_app/data/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LogInController extends GetxController {
  Rx<bool> isButtonEnabled = true.obs;
  Rx<bool> obsecureText = true.obs;

  setButtonEnabled(value) {
    isButtonEnabled.value = value;
  }

  showLoadingDialog() {
    return Get.dialog(Center(
      child: Lottie.asset(TImages.loadingAnim, width: 90, height: 90),
    ));
  }

  dismissLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }

  AuthRepository repository = AuthRepository();

  loginUser(String email, String password) async {
    String? emailErrorString = TValidator.validateEmail(email);
    String? passErrorString = TValidator.validatePassword(password);
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
    setButtonEnabled(false);
    showLoadingDialog();
    repository.loginUserWithFirebase(email, password).then((value) {
      if (value != null) {
        Get.snackbar("Success!", "Login success");
      } else {
        setButtonEnabled(true);
        Get.snackbar("Error!", "Something went wrong!");
      }
      dismissLoadingDialog();
    }).onError((error, stackTrace) {
      Get.snackbar("Error!", error.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      dismissLoadingDialog();
      setButtonEnabled(true);
    });
  }
}
