import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog {
  showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Center(
                child: SizedBox(
              width: 100,
              height: 100,
              child: Lottie.asset(TImages.loadingAnim),
            )));
  }

  dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
