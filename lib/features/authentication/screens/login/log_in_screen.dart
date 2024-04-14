import 'package:ecommerce_app/features/authentication/controllers/authentication/login_controller.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../signup/sign_up_screen.dart';
import '../signup/widgets/form_divider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  final loginController = Get.put(LogInController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  width: 150,
                  height: 150,
                  image: AssetImage(isDarkMode
                      ? TImages.appDarkBackgroundLogo
                      : TImages.appLightBackgroundLogo)),
              Text(
                "Welcome Back!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _emailController,
                expands: false,
                decoration: const InputDecoration(
                  label: Text(TTexts.email),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => TextFormField(
                    controller: _passwordController,
                    expands: false,
                    obscureText: loginController.obsecureText.value,
                    decoration: InputDecoration(
                        label: const Text(TTexts.password),
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: InkWell(
                          onTap: () {
                            loginController.obsecureText.value =
                                !loginController.obsecureText.value;
                          },
                          child: loginController.obsecureText.value
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        )),
                  )),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  TTexts.forgetPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Obx(() => ElevatedButton(
                      onPressed: loginController.isButtonEnabled.value
                          ? () {
                              loginController.loginUser(_emailController.text,
                                  _passwordController.text);
                            }
                          : null,
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(fontFamily: "Poppins"),
                      )))),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Don't have an account?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const SignUpScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOutQuart;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );

                  },
                  child: Text(
                    "Create an account from here?",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 8,
              ),
              const FormDivider(
                dividerText: TTexts.orLoginWith,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(TSizes.xs),
                decoration: BoxDecoration(
                    border: Border.all(color: TColors.grey),
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      width: TSizes.iconMd + 6,
                      height: TSizes.iconMd + 6,
                      image: AssetImage(TImages.google),
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
