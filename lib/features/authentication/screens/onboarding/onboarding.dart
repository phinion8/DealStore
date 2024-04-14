import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/skip_button.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) => controller.updatePageIndicator(index),
            children: const [
              OnBoardingPage(
                width: 300,
                height: 300,
                assetString: TImages.onBoardingImage1,
                title: "Choose From Wide Range Of Products",
                description: "Choose from a wide range of high-quality items curated just for you.",
              ),
              OnBoardingPage(
                width: 300,
                height: 300,
                assetString: TImages.onBoardingImage2,
                title: "Select From Various Payment Methods",
                description: "Shop with ease and convenience! Experience seamless transactions with our diverse range of payment methods.",
              ),
              OnBoardingPage(
                width: 300,
                height: 300,
                assetString: TImages.onBoardingImage3,
                title: "Product Will Be Delivered To Your Doorstep",
                description: "Experience the ultimate convenience with our instant delivery service! Your desired products will be swiftly whisked to your doorstep.",
              ),
            ],
          ),
          OnBoardingSkipButton(
            onTap: () {
              controller.skipButtonClick();
            },
          ),
          OnBoardingNextButton(
            onTap: () {
              controller.nextButtonClick();
            },
          )
        ],
      ),
    );
  }
}

