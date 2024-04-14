import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key,
    this.width = 350,
    this.height = 350,
    required this.assetString,
    required this.title,
    required this.description});

  final double width;
  final double height;
  final String assetString;
  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(assetString, width: width, height: height),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              description,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 64,
            ),
          ]));
  }
}
