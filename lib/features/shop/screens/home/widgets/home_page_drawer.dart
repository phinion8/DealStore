import 'package:ecommerce_app/features/shop/screens/home/controllers/theme_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  final String imageUrl =
      "https://i.pinimg.com/564x/a9/65/20/a96520e0ecfbc1d6c3d40105994382f5.jpg";

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final themeController = Get.put(ThemeController());
    return Drawer(
      backgroundColor: isDarkMode ? TColors.black : TColors.softGrey,
      child: Container(
        color: isDarkMode ? TColors.black : TColors.softGrey,
        child: ListView(
          children: [
            Container(
              color: isDarkMode ? TColors.black : TColors.softGrey,
              child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        color: isDarkMode ? TColors.black : TColors.softGrey),
                    margin: EdgeInsets.zero,
                    currentAccountPicture:
                        CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                    accountEmail: Text(
                      "prianshu831706@gmail.com",
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    accountName: Text(
                      "Priyanshu",
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.home,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.phone,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                "Contact Us",
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.location),
              title: Text("Geolocation",
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16)),
              trailing: Obx(
                () => Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.updateThemeMode(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
