import 'package:advisor/common/text_field_widget.dart';
import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/core/constants/validation.dart';
import 'package:advisor/core/routes/route.dart';
import 'package:advisor/features/auth/view/widget/checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final authController = Get.put(AuthController());
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
                    padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(AppImages.molhemaLogo),
                        Align(
                          alignment: Alignment.topLeft,
                          child:
                          Text(
                            '  Create Account',
                            style: theme.bodyLarge,
                          ),),

                        const SizedBox(height: 30),
                        TextFieldWidget(
                          controller: authController.emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Enter your Emaile'.tr;
                            } else if (!RegExp(Validation.validationEmail)
                                .hasMatch(value)) {
                              return "Please enter a correct Email".tr;
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(Icons.email),
                          label: 'Email',
                        ),
                        TextFieldWidget(
                          controller: authController.nameController,
                          obscureText: false,
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
                          prefixIcon: const Icon(Icons.person),
                          label: 'Name',
                        ),
                        TextFieldWidget(
                          controller: authController.passwordController,
                          obscureText:
                              authController.isVisibility ? false : true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Enter your Password';
                            } else if (!RegExp(Validation.validationPassword)
                                .hasMatch(value)) {
                              return "Please enter a correct Password";
                            } else if (value.toString().length < 7) {
                              return 'Passwords should be at least 8 characters long ';
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                authController.visibility();
                              },
                              icon: authController.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                    )),
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          label: 'Password',
                        ),
                        TextFieldWidget(
                          controller: authController.checkPasswordController,
                          obscureText:
                              authController.isVisibility ? false : true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Enter your Password';
                            } else if (!RegExp(Validation.validationPassword)
                                .hasMatch(value)) {
                              return "Please enter a correct Password";
                            } else if (value.toString().length < 7) {
                              return 'Passwords should be at least 8 characters long ';
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                authController.visibility();
                              },
                              icon: authController.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                    )),
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          label: 'Confirm Password',
                        ),
                        // CheckBoxWidget(
                        //   value: authController.isChecked,
                        //   onChanged: (bool? value) {
                        //     authController.checkBox(value!);
                        //   },
                        //   title: 'I accept',
                        //   supTitle: 'Terms & Conditions',
                        // ),
                        ElevatedButton(
                          onPressed: () async {
                            await authController.signUpWithEmail(
                                authController.emailController.text,
                                authController.passwordController.text,
                                authController.nameController.text);
                          },
                          child: const Text('Signup'),
                        ),
                        Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style: theme.bodySmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offNamed(Routes.loginScreen);
                              },
                              child: Text(
                                'Log In',
                                style: theme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ])),
        ),
      );
    });
  }
}
