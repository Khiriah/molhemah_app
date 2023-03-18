import 'package:advisor/core/constants/validation.dart';
import 'package:advisor/features/auth/view/widget/send_to_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../logic/controller/auth_controller.dart';

class LogInWithPhoneScreen extends StatelessWidget {
  LogInWithPhoneScreen({
    super.key,
  });

  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  final authStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Scaffold(
          body: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    SendToWidget(
                      controller: authController.phoneController,
                      hintText: '5********',
                      authController: authController,
                      onPressed: () async {
                        await authController.signInWithPhone('+966 ${authController.phoneController.text}');
                      },
                      text: 'Enter your Phone Number ',
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter your Password';
                        } else if (!RegExp(Validation.validationPhoneNumber)
                            .hasMatch(value)) {
                          return "Please enter a correct Number";
                        } else if (value.toString().length < 10) {
                          return 'Phone Number should be at least 10 long ';
                        } else {
                          return null;
                        }
                      },
                    )
                  ]))));
    });
  }
}
