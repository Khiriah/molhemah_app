import 'package:advisor/core/constants/colors_app.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? text;
  final String? numCode;
  final String? hintText;
  final bool? enabled;

  const TextFieldWidget({
    required this.controller,
    required this.obscureText,
    required this.validator,
    this.label,
    this.prefixIcon,
    this.numCode,
    this.suffixIcon,
    this.enabled,
    this.hintText,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
        width: 382,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: text == null
                  ? null
                  : Text(
                      "$text",
                      style: theme.bodySmall,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              enabled: enabled,
              style: theme.titleSmall,
              controller: controller,
              obscureText: obscureText,
              cursorColor: mainColor,
              keyboardType: TextInputType.text,
              validator: (value) => validator(value),
              decoration: InputDecoration(
                hintText: hintText,
                labelStyle: theme.bodySmall,
                labelText: label,
                prefixIcon: prefixIcon,
                prefixText: numCode,
                suffixIcon: suffixIcon,
              ),
            ),
          ],
        ));
  }
}
