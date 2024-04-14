import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/rounded_image.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../controllers/home_page_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: (context.screenWidth <= 550) ? 150 : 300,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: [
            TRoundedImage(
              fit: BoxFit.cover,
                clip: true,
                height: null,
                width: THelperFunctions.screenWidth() * 0.9,
                imageUrl: banners[0],
                backgroundColor: Colors.transparent),
            TRoundedImage(
              fit: BoxFit.cover,
              clip: true,
              height: null,
              width: THelperFunctions.screenWidth() * 0.9,
              imageUrl: banners[1],
              backgroundColor: Colors.transparent,
            ),
            TRoundedImage(
              fit: BoxFit.cover,
              clip: true,
              height: null,
              width: THelperFunctions.screenWidth() * 0.9,
              imageUrl: banners[2],
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
                () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: i == 2 ? 0 : 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.carousalCurrentIndex.value == i ? TColors.primary : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
