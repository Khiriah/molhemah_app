import 'package:advisor/core/constants/colors_app.dart';
import 'package:advisor/home/controller/home_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
            title: Text(homeController.title[homeController.currentIndex.value],
                style: theme.headlineLarge),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items:  const <Widget>[
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.chat,
              size: 30,
            ),
            Icon(Icons.video_call, size: 30,),
            // Icon(Icons.games, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Get.isDarkMode?darkColor:whiteColor,
          buttonBackgroundColor: mainColor,
          backgroundColor: whiteColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            homeController.currentIndex.value = index;
          },
          letIndexChange: (index) => true,
        ),
        body: IndexedStack(
          index: homeController.currentIndex.value,
          children: homeController.tabs,
        ),
      );
    });
  }
}
