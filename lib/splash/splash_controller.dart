import 'package:advisor/core/constants/keys.dart';
import 'package:advisor/core/routes/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final getStorge = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorge.read(AppKeys.authKey) != null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.homeScreen);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.loginScreen);  });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
