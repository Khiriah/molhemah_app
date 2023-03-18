import 'package:advisor/core/constants/colors_app.dart';
import 'package:advisor/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.title,
      this.supTitle})
      : super(key: key);
  final ValueChanged<bool?> onChanged;
  final bool value;
  final String title;
  final String? supTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          checkColor: whiteColor,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: theme.headlineSmall,
        ),
        TextButton(
          onPressed: () {
            Get.offNamed(Routes.termsAndConditions);
          },
          child: Text(
            supTitle!,
            style: theme.bodyMedium,
          ),
        )
      ],
    );
  }
}
