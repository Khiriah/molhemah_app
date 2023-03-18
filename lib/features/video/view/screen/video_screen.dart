import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/core/constants/colors_app.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(AppImages.personV, fit: BoxFit.cover),
        ),
        Positioned(
          top: 10,
            left: 320,
            child: Container(
              color: blackColor,
              height: 150,
              width: 100,
              child: Image.asset(AppImages.girlV, fit: BoxFit.cover),
        )),
        Positioned(
          top: 650,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: whiteColor, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      color: greyColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: whiteColor, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic_off,
                      color: greyColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
