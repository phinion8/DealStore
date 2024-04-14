import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class THeaderSearchContainer extends StatelessWidget {
  const THeaderSearchContainer({super.key, this.showBackground = false, this.showBorder = false});

  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            border: showBorder ? Border.all(color: TColors.grey) : null,
            borderRadius: BorderRadius.circular(12),
            color: showBackground
                ? THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light
                : Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Iconsax.search_normal, color: THelperFunctions.isDarkMode(context) ? TColors.grey : TColors.darkGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Search in Store', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
