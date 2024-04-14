import 'package:ecommerce_app/features/shop/screens/product_detail/widgets/rating/widgets/rating_progress_indicator.dart';
import 'package:ecommerce_app/features/shop/screens/product_detail/widgets/rating/widgets/rating_stars.dart';
import 'package:ecommerce_app/features/shop/screens/product_detail/widgets/rating/widgets/review_detail_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/dummy_data.dart';
import '../../../../../../utils/constants/sizes.dart';


class RatingAndReviewsWidget extends StatelessWidget {
  const RatingAndReviewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rating and Reviews",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),),),
                  ),
                  child: const Text(
                    "Rate product",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  ),
                ),
              )
            ]
        ),
        const SizedBox(height: 16,),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// -- Reviews List
                const Text(
                    "Ratings and reviews are verified and are from people who actually purchased the product."),
                const SizedBox(height: 10.0),
                 const RatingAndProgressIndicator(),
                const RatingStars(value: 2.5, size: 20.0),
                const Text("12,611"),
                const SizedBox(height: TSizes.spaceBtwSections),
                Container(
                    decoration: BoxDecoration(
                        color: isDarkMode ? TColors.black : TColors.grey,
                        borderRadius: BorderRadius.circular(16)
                    ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) => ReviewDetailsContainer(productReview: TDummyData.productReviews[index]),
                          separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
                          itemCount: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),),),
                            ),
                            child: const Text(
                              "More Reviews",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}