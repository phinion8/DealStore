import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerce_app/features/authentication/controllers/authentication/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/form_divider.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/terms_and_conditions_check_box.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final singUpController = Get.put(SignUpController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  String countryCode = "";


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //header section
                  Image(
                      height: 150,
                      width: 150,
                      image: AssetImage(isDarkMode
                          ? TImages.appDarkBackgroundLogo
                          : TImages.appLightBackgroundLogo)),
                  Text(
                    "Create your new account...",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //form section

                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            expands: false,
                            decoration: const InputDecoration(
                                label: Text(TTexts.firstName),
                                prefixIcon: Icon(Iconsax.user)),
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            expands: false,
                            decoration: const InputDecoration(
                                label: Text(TTexts.lastName),
                                prefixIcon: Icon(Iconsax.user)),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailController,
                    expands: false,
                    decoration: const InputDecoration(
                        label: Text(TTexts.email),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      // Expanded(child:
                      //
                      // ),
                      Expanded(child: TextFormField(
                        controller: _phoneNumController,
                        keyboardType: TextInputType.number,
                        expands: false,
                        decoration: InputDecoration(
                            label: const Text(TTexts.phone),
                            prefixIcon: CountryCodePicker(
                              onChanged: (value) {
                                singUpController.countryCode.value = value.toString();
                              },
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'IN',
                              favorite: const ['+91', 'IN'],
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                              backgroundColor: isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                              boxDecoration: BoxDecoration(
                                  color: isDarkMode ? Colors.black : Colors
                                      .white,
                                  boxShadow: null,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              searchDecoration: InputDecoration(
                                iconColor: isDarkMode ? Colors.white : Colors
                                    .black,
                                border: isDarkMode ? const OutlineInputBorder()
                                    .copyWith(
                                  borderRadius: BorderRadius.circular(
                                      TSizes.inputFieldRadius),
                                  borderSide: const BorderSide(
                                      width: 1, color: TColors.darkGrey),
                                ) : const OutlineInputBorder().copyWith(
                                  borderRadius: BorderRadius.circular(
                                      TSizes.inputFieldRadius),
                                  borderSide: const BorderSide(
                                      width: 1, color: TColors.grey),
                                ),
                                labelText: "Search Country",
                                labelStyle: isDarkMode ? const TextStyle()
                                    .copyWith(fontSize: TSizes.fontSizeMd,
                                    color: TColors.white)
                                    : const TextStyle().copyWith(
                                    fontSize: TSizes.fontSizeMd,
                                    color: TColors.black),
                              ),
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineSmall,
                              dialogTextStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                              dialogBackgroundColor: Colors.black.withOpacity(
                                  0.1),
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                            ),
                            suffixIcon: const Icon(Iconsax.call)),
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() =>
                      TextFormField(
                        controller: _passwordController,
                        expands: false,
                        obscureText: singUpController.obsecureText.value,
                        decoration: InputDecoration(
                            label: const Text(TTexts.password),
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: InkWell(
                              onTap: () {
                                singUpController.obsecureText.value =
                                !singUpController.obsecureText.value;
                              },
                              child: singUpController.obsecureText.value
                                  ? const Icon(Iconsax.eye_slash)
                                  : const Icon(Iconsax.eye),
                            )),
                      )),
                  const SizedBox(
                    height: 16,
                  ),

                  //terms and condition check box
                  const TermsAndConditionsCheckBox(),

                  const SizedBox(
                    height: 24,
                  ),

                  //register button
                  SizedBox(
                      width: double.infinity,
                      child: Obx(() =>
                          ElevatedButton(
                              onPressed: singUpController.isButtonEnabled.value
                                  ? () async {
                                singUpController.registerUser(
                                    _emailController.text,
                                    _passwordController.text,
                                    "$countryCode${_phoneNumController.text}",
                                    _firstNameController.text,
                                    _lastNameController.text);
                              }
                                  : null,
                              child: const Text(
                                TTexts.register,
                                style: TextStyle(fontFamily: "Poppins"),
                              )))
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  //footer section
                  const FormDivider(
                    dividerText: TTexts.orSignUpWith,
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
                  )
                ],
              ),
            )));
  }
}
