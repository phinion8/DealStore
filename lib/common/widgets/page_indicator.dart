import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.controller,
    required this.count
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SmoothPageIndicator(
      count: count,
      controller: controller,
      effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.white: TColors.black, dotHeight: 6),
    );
  }
}