import 'package:advisor/common/text_field_widget.dart';
import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/core/constants/validation.dart';
import 'package:advisor/core/routes/route.dart';
import 'package:advisor/features/auth/view/widget/checkbox_widget.dart';
import 'package:advisor/features/auth/view/widget/signin_with_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/auth_controller.dart';




class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<AuthController>(builder: (_) {
      return Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
                        '  Login',
                        style: theme.bodyLarge,
                      ),),
                      const SizedBox(height: 50),
                      TextFieldWidget(
                        controller: authController.emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(Validation.validationEmail)
                              .hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                        label: 'Email',
                      ),
                      TextFieldWidget(
                        controller: authController.passwordController,
                        obscureText: authController.isVisibility ? false : true,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter your Password';
                          } else if (!RegExp(Validation.validationPassword)
                              .hasMatch(value)) {
                            return "Please enter a correct Password";
                          } else if (value.toString().length < 7) {
                            return '';
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
                                ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        label: 'Password',
                      ),
                      CheckBoxWidget(
                        value: authController.isChecked,
                        onChanged: (bool? value) {
                          authController.checkBox(value!);
                        },
                        title: 'Remember me',
                        supTitle: '',
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await authController.signInWithEmail(
                              authController.emailController.text,
                              authController.passwordController.text);
                        },
                        child: const Text('logIn'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.forgotPasswordScreen);
                        },
                        child: Text('Forgot password ?',
                            style: theme.headlineSmall),
                      ),
                      SignInWithWidget(
                        onPressed: () {
                          Get.offNamed(Routes.logInWithPhoneScreen);
                        },
                        text: 'Sign In with Phone',
                        images: AppImages.phoneLogo,
                      ),
                      SignInWithWidget(
                        onPressed: () async {
                          await authController.signInWithGoogle();
                        },
                        text: 'Sign In with Google',
                        images: AppImages.googleLogo,
                      ),
                      SignInWithWidget(
                        onPressed: () {},
                        text: 'Sign In with Apple',
                        images: AppImages.appleLogo,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "  Don't have an Account?",
                            style: theme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offNamed(Routes.signScreen);
                            },
                            child: Text(
                              'Sign UP',
                              style: theme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ));
    });
  }
}
