import 'package:ecommerce_app/common/widgets/page_indicator.dart';
import 'package:ecommerce_app/common/widgets/read_more_text.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'controllers/product_detail_controller.dart';
import 'package:ecommerce_app/features/shop/screens/product_detail/widgets/rating/rating_and_reviews.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../common/widgets/circular_container.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productItem})
      : super(key: key);

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductDetailController());

    final imageList = (productItem.images != null)
        ? productItem.images
        : [productItem.thumbnail];

    controller.selectedProductImage.value = imageList![0];


    final colorList = productItem.productAttributes!
        .filter((value) => value.name == 'Color')
        .toList();

    final sizeList = productItem.productAttributes!
        .filter((value) => value.name == 'Size')
        .toList();



    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: isDarkMode
              ? Colors.black
              : Colors.white, // Set the status bar background color
          statusBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: isDarkMode ? TColors.black : TColors.grey),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 12, top: 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Product detail custom app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: isDarkMode ? Colors.white : Colors.black,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: isDarkMode ? TColors.black : TColors.grey,
                          ),
                          child: const Icon(Iconsax.heart),
                        ),
                      )
                    ],
                  ),
                  Hero(
                    tag: Key(productItem.id.toString()),
                    child: SizedBox(
                      height: 200,
                      child: PageView(
                        onPageChanged: (index) {
                          controller.updatePageIndicator(index);
                          controller.selectedProductImage.value =
                          imageList[index];
                        },
                        controller: controller.pageController,
                        children: (productItem.images != null)
                            ? imageList
                            .map((image) => Image.asset(image))
                            .toList()
                            : [Image.asset(productItem.thumbnail)],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomPageIndicator(
                    count: imageList.length,
                    controller: controller.pageController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Select Variant",
                      textAlign: TextAlign.start,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 80, // Set a fixed height or use Expanded
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          final selectedImage =
                              controller.selectedProductImage.value ==
                                  imageList[index];
                          return ProductVariationItem(
                            image: imageList[index],
                            onPressed: () {
                              controller.selectedProductImage.value =
                              imageList[index];
                              controller.pageController.jumpToPage(index);
                            },
                            shouldShowBorder: selectedImage,
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      productItem.title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.star5,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Center(
                        child: Text(
                          "4.9 (50 ratings)",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Stock:",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge!,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        (productItem.stock != 0) ? "In Stock" : "Out Of Stock",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            color: (productItem.stock != 0)
                                ? Colors.green
                                : Colors.red[400]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        TImages.nikeLogo,
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        productItem.brand!.name,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "More from ${productItem.brand!.name}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  //Select color
                  if (colorList.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Select Color",
                            textAlign: TextAlign.start,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: SizedBox(
                            height: 40,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: colorList[0]
                                    .values!
                                    .map((color) =>
                                    Obx(() {
                                      final selected =
                                          controller.selectedColor.value ==
                                              color;
                                      return ChipSelectionItem(
                                        color: color,
                                        selected: selected,
                                        onSelected: (value) {
                                          controller.selectedColor.value =
                                              color;
                                        },
                                      );
                                    }))
                                    .toList()),
                          ),
                        ),
                      ],
                    ),
                  //Select size
                  if (sizeList.isNotEmpty)
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Select Size",
                            textAlign: TextAlign.start,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: sizeList[0]
                                  .values!
                                  .map((size) =>
                                  Obx(() {
                                    final selected =
                                        controller.selectedSize.value ==
                                            size;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: ChipSelectionItem(
                                          text: size,
                                          selected: selected,
                                          onSelected: (value) {
                                            controller.selectedSize.value =
                                                size;
                                          }),
                                    );
                                  }))
                                  .toList()),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Description",
                      textAlign: TextAlign.start,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: isDarkMode ? TColors.black : TColors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 16, bottom: 16),
                        child: ReadMoreText(
                            text:
                            "As of my last knowledge update in January 2022, Nike is a globally renowned athletic footwear and apparel company. Nike, Inc., was founded on January 25, 1964, by Bill Bowerman and Phil Knight. It has since become one of the most prominent and recognizable sportswear brands in the world.Nike offers a wide range of athletic shoes, including running shoes, basketball shoes, soccer cleats, training shoes, and more. Here's a general description of Nike shoes:",
                            maxLines: 5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const RatingAndReviewsWidget(),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: isDarkMode ? TColors.black : TColors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$${productItem.price}",
                          style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "\$${(productItem.salePrice != null) ? productItem
                              .salePrice : productItem.price}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                        backgroundColor: MaterialStatePropertyAll(
                            isDarkMode ? Colors.black : Colors.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                      ),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontFamily: 'Poppins'),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductVariationItem extends StatelessWidget {
  const ProductVariationItem({Key? key,
    required this.image,
    required this.onPressed,
    required this.shouldShowBorder})
      : super(key: key);

  final String image;
  final VoidCallback onPressed;
  final bool shouldShowBorder;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isDarkMode ? TColors.black : TColors.grey,
            border: Border.all(
              color: shouldShowBorder ? TColors.primary : Colors.transparent,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}

class ChipSelectionItem extends StatelessWidget {
  const ChipSelectionItem({super.key,
    this.color,
    required this.selected,
    required this.onSelected,
    this.text});

  final String? text;
  final String? color;
  final bool selected;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        // Use this function to get Colors as a Chip
        avatar: color != null
            ? TCircularContainer(
            width: 80,
            height: 80,
            backgroundColor: THelperFunctions.getColor(color!)!)
            : null,
        label: (text != null)
            ? Text(
          text!,
        )
            : const SizedBox(),
        selected: selected,
        onSelected: onSelected,
        labelPadding: color != null ? const EdgeInsets.all(0) : null,
        padding: color != null ? const EdgeInsets.all(0) : null,
        shape: color != null ? const CircleBorder() : null,
        backgroundColor: color != null
            ? THelperFunctions.getColor(color!)
            : Colors.transparent,
        // labelStyle: TextStyle(color: selected ? TColors.white : null),
      ),
    );
  }
}

class ColorSelectionItem extends StatelessWidget {
  const ColorSelectionItem({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: TColors.white, width: 1),
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}

class SizeSelectionItem extends StatelessWidget {
  const SizeSelectionItem({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 1)),
          child: Center(child: Text(size))),
    );
  }
}
