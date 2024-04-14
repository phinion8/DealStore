import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/local_storage/storage_utility.dart';
import '../../screens/login/log_in_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  Rx<int> currentPageIndex = 0.obs;
  Rx<double> nextButtonProgressIndicatorPercentage = 0.33.obs;
  final pageController = PageController();
  final bool isOnBoardingCompleted = false;

  void updatePageIndicator(index) {
    currentPageIndex.value = index;
    if(index == 0){
      nextButtonProgressIndicatorPercentage.value = 0.33;
    }else if(index == 1){
      nextButtonProgressIndicatorPercentage.value = 0.66;
    }else{
      nextButtonProgressIndicatorPercentage.value = 1;
    }
  }

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextButtonClick() {
    if (currentPageIndex.value == 2) {
      TLocalStorage localStorage = TLocalStorage();
      localStorage.saveData("onBoardingKey", true);

      Get.to(const LogInScreen());
    } else {
      if(nextButtonProgressIndicatorPercentage > 0.66){
        nextButtonProgressIndicatorPercentage.value = 1;
      }else{
        nextButtonProgressIndicatorPercentage.value += 0.33;
      }
      currentPageIndex.value++;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }


  void skipButtonClick() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
