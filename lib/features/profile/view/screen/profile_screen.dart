import 'package:advisor/core/routes/route.dart';
import 'package:advisor/core/theme/controller/theme_controller.dart';
import '../../logic/controller/profile_conroller.dart';
import 'package:advisor/features/profile/view/widget/logout_widget.dart';
import 'package:advisor/features/profile/view/widget/profile_header_widget.dart';
import 'package:advisor/features/profile/view/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return  SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 50),
                  ProfileHeaderWidget(
                    profileController: profileController,
                    name: profileController.nameController.text,
                    email: profileController.emailController.text,
                  ),
                  const SizedBox(height: 60),
                  ProfileWidget(
                    text: 'Personal Information',
                    onTap: () {
                      Get.toNamed(Routes.personalInformation);
                    },
                    icon: Icons.arrow_forward_ios,
                  ),
                  ProfileWidget(
                    text: 'Dark Mode',
                    onTap: () {
                      {
                        ThemeController().changesTheme();
                        profileController.isDarkTheme =
                            ThemeController().getThemeDataFromBox();
                      }
                    },
                    icon: Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  ),
                  const SizedBox(height: 20),
                  LogOutWidget(),
                ],
              ),
            ),
          ]),
        );
    });
  }
}
