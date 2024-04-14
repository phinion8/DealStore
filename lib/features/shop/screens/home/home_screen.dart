import 'package:ecommerce_app/common/widgets/cart_icon_with_badge.dart';
import 'package:ecommerce_app/data/dummy_data.dart';
import 'package:ecommerce_app/features/shop/screens/home/controllers/product_item_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/grid_product_item.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/header_categories.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_page_drawer.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/image_slider.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../product_detail/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final productList = TDummyData.products;
  final productItemController = Get.put(ProductItemController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: isDarkMode
              ? Colors.black
              : Colors.white
              .withOpacity(0.5), // Set the status bar background color
          statusBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
          systemNavigationBarColor:
          isDarkMode ? Colors.black : TColors.white),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const HomePageDrawer(),
          body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                           children: [
                            InkWell(
                              onTap: (){
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              child: Image(
                                image: AssetImage( isDarkMode? TImages.navigationDrawerIconDark : TImages.navigationDrawerDrawerIconLight),
                                width: 35,
                                height: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "DealStore",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CartMenuIcon(onPressed: () {}),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Iconsax.search_normal,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TPromoSlider(
                      banners: [TImages.banner2, TImages.banner3, TImages.banner4]),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        const HomePageTextHeading(title: "Categories"),
                        const SizedBox(
                          height: 16,
                        ),
                        const THeaderCategories(),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                                child: const Image(image: AssetImage(TImages.banner9), fit: BoxFit.cover,))
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const HomePageTextHeading(title: "Popular Products"),
                        const SizedBox(
                          height: 16,
                        ),
                        GridView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 288),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.to(
                                  ProductDetailsScreen(
                                      productItem: productList[index]), transition: Transition.fadeIn);
                            },
                            child: GridProductItem(
                              productItem: productList[index],
                            ),
                          ),
                        ),
                        SizedBox(height: 16,),
                        const HomePageTextHeading(title: "Highlights"),
                        const SizedBox(height: 16,),
                        GridView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 288),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.to(
                                  ProductDetailsScreen(
                                      productItem: productList.sublist(5, 9)[index]), transition: Transition.fadeIn);
                            },
                            child: GridProductItem(
                              productItem: productList.sublist(5, 9)[index],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
    );
  }
}

class HomePageTextHeading extends StatelessWidget {
  const HomePageTextHeading({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
        ),
        Text(
          "View all",
          textAlign: TextAlign.end,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.normal, fontSize: 12)
        )
      ],
    );
  }
}
