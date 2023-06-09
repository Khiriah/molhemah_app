import 'package:advisor/common/text_field_widget.dart';
import '../../logic/controller/auth_controller.dart';

import 'package:flutter/material.dart';

class SendToWidget extends StatelessWidget {
  const SendToWidget(
      {Key? key,
      required this.authController,
      required this.onPressed,
      required this.text,
      required this.validator, required this.hintText, required this.controller})
      : super(key: key);
  final Function() onPressed;
  final AuthController authController;
  final String text;
  final String hintText;
  final Function validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 390,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            text,
            // 'Enter Email Address ',
            style: theme.headlineLarge,
          ),
          TextFieldWidget(
            hintText: hintText,
            text: text,
            controller: controller,
            obscureText: false,
            validator: validator,
            prefixIcon: const Icon(Icons.email),
            // height: 50,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text("Send"),
          ),
        ],
      ),
    );
  }
}
