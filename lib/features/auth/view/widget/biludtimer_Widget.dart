import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../logic/controller/auth_controller.dart';


class BuildTimerWidget extends StatelessWidget {
  const BuildTimerWidget({
    Key? key,
    required this.authController,
  }) : super(key: key);
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Yuo may receive he code within ",
          style: theme.bodyMedium,
        ),
        GetBuilder<AuthController>(builder: (controller) {
          return Countdown(
            controller: controller.controller,
            seconds: 60,
            build: (_, double time) => Text(
              "00:${time.toString()}",
              style: theme.bodyMedium,
            ),
            interval: const Duration(seconds: 1),
            onFinished: () {
              authController.resend.value = !authController.resend.value;
            },
          );
        }),
      ],
    );
  }
}
