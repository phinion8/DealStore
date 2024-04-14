import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        right: TSizes.defaultSpace,
        left: TSizes.defaultSpace,
        child: Obx(
              () => CircularPercentIndicator(
            animateFromLastPercent: true,
            animation: true,
            animationDuration: 500,
            radius: 50.0,
            lineWidth: 3.0,
            percent: controller.nextButtonProgressIndicatorPercentage.value,
            center: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.primary
                      : TColors.black,
                  shape: const CircleBorder()),
              child: const Icon(Iconsax.arrow_right_3),
            ),
            progressColor: TColors.primary,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey,
          ),
        ));
  }
}