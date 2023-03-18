import '../../logic/controller/auth_controller.dart';

import 'package:advisor/features/auth/view/widget/text_field_otp_widget.dart';
import 'package:flutter/material.dart';

class FormOtbWidget extends StatelessWidget {
  const FormOtbWidget({Key? key, required this.authController})
      : super(key: key);
  final AuthController authController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldOtpWidget(
            controller: authController.otp1Controller,
            onChanged: (value) {
              authController.nextField(
                  value: value, focusNode: authController.pin2FocusNode);
            },
          ),
          TextFieldOtpWidget(
            controller: authController.otp2Controller,
            onChanged: (value) {
              authController.nextField(
                  value: value, focusNode: authController.pin3FocusNode);
            },
          ),
          TextFieldOtpWidget(
            controller: authController.otp3Controller,
            onChanged: (value) {
              authController.nextField(
                  value: value, focusNode: authController.pin4FocusNode);
            },
          ),
          TextFieldOtpWidget(
            controller: authController.otp4Controller,
            onChanged: (value) {
              authController.nextField(
                  value: value, focusNode: authController.pin5FocusNode);
            },
          ),
          TextFieldOtpWidget(
            controller: authController.otp5Controller,
            onChanged: (value) {
              authController.nextField(
                  value: value, focusNode: authController.pin6FocusNode);
            },
          ),
          TextFieldOtpWidget(
            focusNode: authController.pin5FocusNode,
            controller: authController.otp6Controller,
            onChanged: (value) {
              authController.pin6FocusNode?.unfocus();
            },
          ),
        ],
      ),
    );
  }
}
