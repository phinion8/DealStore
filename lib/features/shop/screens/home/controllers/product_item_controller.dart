import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../../../utils/constants/image_strings.dart';

class ProductItemController extends GetxController{

  Rx<bool> isLoading = true.obs;

  showLoadingDialog() {
    return Get.dialog(Center(
      child: Lottie.asset(TImages.loadingAnim, width: 90, height: 90),
    ));
  }

  dismissLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }

  Future<PaletteGenerator> updatePaletteGenerator(ProductModel productItem) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
        Image.asset( (productItem.images == null) ? productItem.thumbnail : productItem
            .images![0] ).image
    );
    return paletteGenerator;
  }



}