import 'package:advisor/core/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.onTap, required this.text, this.icon})
      : super(key: key);
  final GestureTapCallback onTap;
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
               Icon(
                icon,
                 size:30 ,
                color: Get.isDarkMode?whiteColor : blackColor,
              )
            ],
          ),
           const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
