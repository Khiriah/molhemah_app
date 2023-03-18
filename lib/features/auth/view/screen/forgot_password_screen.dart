import 'package:advisor/core/constants/validation.dart';
import 'package:advisor/core/routes/route.dart';
import 'package:advisor/features/auth/view/widget/send_to_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../logic/controller/auth_controller.dart';


class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({
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
                      hintText: 'email@gmail.com',
                      controller: authController.emailController,
                      authController: authController,
                      onPressed: () async {
                        await authController.forgotPassword(authController.emailController.text);
                        Get.offNamed(Routes.loginScreen);
                      },
                      text: 'Enter your Email ',
                      validator: (value) {
                        if (!RegExp(Validation.validationEmail)
                            .hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                    )
                  ]))));
    });
  }
}
