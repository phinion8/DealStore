import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../navigation/bottom_navigation.dart';
import '../../../../authentication/screens/onboarding/onboarding.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
    checkForUserAndMoveToOtherScreen();
  }

  Future<void> checkForUserAndMoveToOtherScreen() async{
    await Future.delayed(const Duration(seconds: 2));
    FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null){
      Get.to(() => const NavigationMenu(), transition: Transition.fadeIn);
    }else{
      Get.to(() => const OnBoardingScreen(), transition: Transition.fadeIn);
    }
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }
}