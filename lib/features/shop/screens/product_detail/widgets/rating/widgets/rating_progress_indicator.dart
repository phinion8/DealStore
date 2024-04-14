import 'package:flutter/material.dart';

import '../../../../../../../utils/device/device_utility.dart';

class RatingAndProgressIndicator extends StatelessWidget {
  const RatingAndProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text("4.7", style: Theme.of(context).textTheme.displayLarge)),
        const SizedBox(width: 40),
        const Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              RatingProgressIndicator(text: '5', value: 1.0),
              RatingProgressIndicator(text: '4', value: 0.8),
              RatingProgressIndicator(text: '3', value: 0.6),
              RatingProgressIndicator(text: '2', value: 0.4),
              RatingProgressIndicator(text: ' 1', value: 0.1),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 14.0)),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 11.0,
            width: TDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(11),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(Colors.blue[700]),
              minHeight: 25,
              value: value,
            ),
          ),
        ),
        const SizedBox(
          height: 22.0,
        ),
      ],
    );
  }
}