import 'package:advisor/core/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldOtpWidget extends StatelessWidget {
  const TextFieldOtpWidget(
      {Key? key,
      this.focusNode,
      required this.controller,
      required this.onChanged})
      : super(key: key);
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
          cursorColor: blackColor,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: otpInputDecoration(),
          controller: controller,
          onChanged: onChanged),
    );
  }

  InputDecoration otpInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
      border: outlineInputBorder(),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Get.isDarkMode ? whiteColor : blackColor,
      ),
    );
  }
}
