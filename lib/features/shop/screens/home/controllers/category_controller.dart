import 'package:get/get.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../data/models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// -- Load selected category data
  List<CategoryModel> getFeaturedCategories(int take) {
    // Get Featured Brands from your data source
    return TDummyData.categories
        .where((category) => (category.isFeatured ?? false) && category.parentId == null)
        .take(take)
        .toList();
  }

  /// -- Load selected category data
  List<CategoryModel> getSubCategories(String categoryId) {
    // Fetch all categories where ParentId = categoryId;
    final subCategories = TDummyData.categories.where((category) => category.parentId == categoryId).toList();
    return subCategories;
  }

}
