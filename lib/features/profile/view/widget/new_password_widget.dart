import 'package:advisor/common/text_field_widget.dart';
import 'package:advisor/core/constants/validation.dart';
import 'package:advisor/core/routes/route.dart';
import '../../logic/controller/profile_conroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordWidget extends StatelessWidget {
  const NewPasswordWidget({Key? key, required this.profileController})
      : super(key: key);
  final ProfileController profileController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Text(
              'New Password',
              style: theme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Set the new password for your account ',
              style: theme.bodyMedium,
            ),
            const SizedBox(height: 50),
            TextFieldWidget(
              controller: profileController.yourPasswordController,
              obscureText: profileController.isVisibility ? false : true,
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
                  profileController.visibility();
                },
                icon: profileController.isVisibility
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
              label: 'Your Password',
            ),
            TextFieldWidget(
              controller: profileController.passwordController,
              obscureText: profileController.isVisibility ? false : true,
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
                  profileController.visibility();
                },
                icon: profileController.isVisibility
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
              label: 'New Password',
            ),
            TextFieldWidget(
              controller: profileController.resetPasswordController,
              obscureText: profileController.isVisibility ? false : true,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Enter your Password';
                } else if (profileController.passwordController ==
                    profileController.resetPasswordController) {
                  return 'The password does not match please try again';
                } else {
                  return null;
                }
              },
              suffixIcon: IconButton(
                onPressed: () {
                  profileController.visibility();
                },
                icon: profileController.isVisibility
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
              label: 'Confirm Password',
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                Get.offNamed(Routes.successfullyScreen);
              },
              child: const Text('Update Password'),
            ),
          ],
        ));
  }
}
