import '../../logic/controller/auth_controller.dart';
import 'package:advisor/features/auth/view/widget/biludtimer_Widget.dart';
import 'package:advisor/features/auth/view/widget/form_otb_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPhoneScreen extends StatelessWidget {
  OtpPhoneScreen({
    super.key,
  });

  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<AuthController>(builder: (_) {
      return Scaffold(
          body: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: 390,
                      height: 400,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const SizedBox(height: 50),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Enter OTP",
                                style: theme.headlineMedium,
                              ),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sent to ",
                                  style: theme.headlineSmall,
                                )),
                            BuildTimerWidget(
                              authController: authController,
                            ),
                            const SizedBox(height: 50),
                            FormOtbWidget(
                              authController: authController,
                            ),
                            GestureDetector(
                                onTap: () {
                                  //resend OTP code
                                  authController.otp1Controller.text;
                                  authController.otp2Controller.text;
                                  authController.otp3Controller.text;
                                  authController.otp4Controller.text;
                                  authController.otp5Controller.text;
                                  authController.otp6Controller.text;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child:
                                      Obx(() => authController.resend == false
                                          ? Text(
                                              "Resend Code",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.grey[400]),
                                            )
                                          : TextButton(
                                              child: Text(
                                                "Resend Code",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.green[400]),
                                              ),
                                              onPressed: () {},
                                            )),
                                )),
                            const SizedBox(height: 50),
                            ElevatedButton(
                                onPressed: () {
                                  authController.verifyPhoneNum(
                                    Get.arguments,
                                    authController.otp1Controller.text +
                                        authController.otp2Controller.text +
                                        authController.otp3Controller.text +
                                        authController.otp4Controller.text +
                                        authController.otp5Controller.text +
                                        authController.otp6Controller.text,
                                  );
                                  // Get.offNamed(Routes.successfullyScreen);
                                },
                                child: const Text('Send'))
                          ]),
                    ),
                  ]))));
    });
  }
}
