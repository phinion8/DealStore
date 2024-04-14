import 'package:get/get.dart';

class Go {
  /// Similar to **Navigation.push()**
  static Future<T?> to<T>(dynamic page, {dynamic arguments, Transition? transition, bool? opaque}) async {
    return await Get.to<T>(page,
        arguments: arguments,
        transition: transition ?? Transition.rightToLeft,
        duration: const Duration(milliseconds: 350),
        opaque: opaque);
  }

  /// Similar to **Navigation.pushReplacement**
  static Future<dynamic> off(dynamic page, {dynamic arguments, Transition? transition}) async {
    Get.off(
      page,
      arguments: arguments,
      transition: transition ?? Transition.rightToLeft,
      duration: const Duration(milliseconds: 350),
    );
  }

  /// Similar to **Navigation.pushAndRemoveUntil()**
  static Future<dynamic> offUntil(dynamic page, {Transition? transition}) async {
    Get.offUntil(
        GetPageRoute(
          page: page,
          transition: transition ?? Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 350),
        ),
            (route) => false);
  }
}