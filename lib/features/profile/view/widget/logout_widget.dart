import '../../logic/controller/profile_conroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return   InkWell(
      onTap: () {
        profileController.signOut();
      },
      child: Row(
        children: [
          Text(
            'Log Out',
            style: theme.headlineMedium,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.logout,
          )
        ],
      ),
    );
  }
}
