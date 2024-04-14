import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_vertical.dart';
import '../controllers/home_page_controller.dart';

class THeaderCategories extends StatelessWidget {
  const THeaderCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final categories = controller.getFeaturedCategories();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// -- Categories
        SizedBox(
          height: 88,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            itemCount: categories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categories[index];
              return TImageTextVertical(
                image: category.image,
                title: category.name,
                onTap: (){},
                textColor: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,
              );
            },
          ),
        )
      ],
    );
  }
}
