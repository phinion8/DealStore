

import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerce_app/localization/supported_locals.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/shop/screens/splash_screen/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context)  {
    return GetMaterialApp(
      supportedLocales: supportedLocalList(),
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      defaultTransition: Transition.leftToRight,
    );
  }
}
