import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController{


  Rx<int> currentImageIndex = 0.obs;

  final pageController = PageController();

  Rx<String> selectedProductImage = ''.obs;

  updatePageIndicator(int index){
    currentImageIndex.value = index;
  }

  Rx<String> selectedColor = ''.obs;

  Rx<String> selectedSize = ''.obs;



}