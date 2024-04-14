import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_title.dart';
import 'circular_image.dart';

class TImageTextVertical extends StatelessWidget {
  const TImageTextVertical({
    super.key,
    required this.image,
    required this.title, this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              backgroundColor: backgroundColor,
              padding: TSizes.sm * 1.4,
              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: TBrandTitleText(title: title, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
