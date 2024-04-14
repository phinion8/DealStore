import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  showErrorSnackbar(String message) {
    Get.snackbar("Error!", "Something went wrong!", backgroundColor: Colors.red,
        colorText: Colors.white);
  }
}