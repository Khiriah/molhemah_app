import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/constants/keys.dart';

class LocalizationController {

  //change Language
  GetStorage localeStorage = GetStorage();
  Locale? initialLanguage = GetStorage().read(AppKeys.langKey) == null
      ? Get.deviceLocale
      : Locale(GetStorage().read(AppKeys.langKey));

  void changeLanguage(String codeLanguage) async {
    Locale locale = Locale(codeLanguage);
    initialLanguage = Locale(codeLanguage);
    await localeStorage.write(AppKeys.langKey, codeLanguage);
    Get.updateLocale(locale);
  }
}
