import 'package:get/get.dart';
import '../../../../../data/models/category_model.dart';
import 'category_controller.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final Rx<int> carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  List<CategoryModel> getFeaturedCategories() {
    final categoryController = Get.put(CategoryController());
    return categoryController.getFeaturedCategories(8);
  }
 }


