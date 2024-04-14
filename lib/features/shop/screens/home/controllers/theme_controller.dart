import 'package:ecommerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController{
  Rx<bool> isDarkMode = false.obs;

  updateThemeMode(value){
    isDarkMode.value = value;
    Get.isDarkMode? Get.changeTheme(TAppTheme.darkTheme):Get.changeTheme(TAppTheme.lightTheme);
    update();
  }
  ThemeMode get currentTheme => isDarkMode.value ? ThemeMode.light : ThemeMode.dark;



}