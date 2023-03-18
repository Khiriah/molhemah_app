import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/core/constants/keys.dart';
import 'package:advisor/features/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/routes/route.dart';
import '../repo/profile_repo.dart';

class ProfileController extends GetxController {

  //change the Language to arabic
  bool changeLanguage = false;

  //Change Theme
  bool isDarkTheme = false;


  ProfileRepository profileRepository = ProfileRepository();
  GetStorage authStorage = GetStorage();

  String? profilePhoto = '';

  //Password icon
  bool isVisibility = false;

  //Personal Info
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //Change Password
  TextEditingController passwordController = TextEditingController();
  TextEditingController yourPasswordController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  ///////////////////onInit///////////////////////////
  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  //fun for Password icon
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }


  UserModel? getUserInfo()  {
     var user = profileRepository.getUserInfo(
       authStorage.read(AppKeys.authKey) ?? ''
     );
     nameController.text = user?.displayName ?? 'Hello user';
     emailController.text = user?.email ?? 'example@gmail.com';
     profilePhoto = user?.photoURL;

     return user;
  }

  updateUserInfo({required UserModel userModel}) async {
    await profileRepository.updateUserInfo(
      userModel: userModel,
      onError: () {
        Get.snackbar('something went wrong', '');
      }, uid: authStorage.read(AppKeys.authKey)
      ,
    );
  }

  changePassword({
    required String newPassword,
  }) async {
    await profileRepository.changePassword(
      uid: authStorage.read(AppKeys.authKey),
      newPassword: newPassword,
      onError: (e) {
        print(e);
        Get.snackbar('something went wrong', e);
      },
      onDone: () {
        Get.offNamed(Routes.loginScreen);
      },
    );
  }

  signOut() async {
    await profileRepository.signOut(
      onError: (String e) {
        Get.snackbar(
          'something went wrong',
          e,
        );
      },
      onDone: () {
        authStorage.remove(AppKeys.authKey);
        Get.offAllNamed(Routes.loginScreen);
      },
    );
  }
}
