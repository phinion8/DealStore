import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.darkGrey
                    : TColors.grey,
                thickness: 0.5,
                endIndent: 5,
                indent: 60)),
        Text(dividerText,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
              color: Colors.grey
            )),
        Flexible(
            child: Divider(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.darkGrey
                    : TColors.grey,
                thickness: 0.5,
                endIndent: 60,
                indent: 5)),
      ],
    );
  }
}
