import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class GridProductItem extends StatelessWidget{
  
  const GridProductItem({super.key, required this.productItem, this.backgroundColor = Colors.transparent});

  final ProductModel productItem;
  final Color backgroundColor;

  @override
  build(BuildContext context) {

    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    int currentPrice = 0;
    int discount = 0;
    if (productItem.salePrice == null) {
      currentPrice = productItem.price.toInt();
    } else {
      discount =
          (((productItem.price - productItem.salePrice!) / productItem.price) * 100)
              .toInt();
      currentPrice = productItem.salePrice!.toInt();
    }

    return Card(
      color: isDarkMode ? TColors.black : TColors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isDarkMode ? Colors.black : backgroundColor,
                  ),
                  child: Hero(
                    tag: Key(productItem.id),
                    child: Image(
                      image: AssetImage(
                        (productItem.images == null)
                            ? productItem.thumbnail
                            : productItem.images![0],
                      ),
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "$discount%",
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.orange.withOpacity(0.5),
                        ),
                        child: Icon(Iconsax.heart, color: Colors.white,),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Text(
                      productItem.title,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      productItem.brand!.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: TColors.primary),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          "\$$currentPrice",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.black : Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Iconsax.add),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
