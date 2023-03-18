import 'package:advisor/core/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_theme.dart';

ThemeData lightThemeData() {
  return ThemeData(
    fontFamily: GoogleFonts.ubuntu.toString(),
    primaryColor: whiteColor,
    cardColor: lightColor,
    highlightColor: greyColor,
    splashColor: Colors.transparent,
    canvasColor: lightColor,
    dialogBackgroundColor: lightColor,
    disabledColor: lightColor,
    dividerColor: darkColor,
    focusColor: lightColor,
    hintColor: lightColor,
    indicatorColor: lightColor,
    primaryColorLight: lightColor,
    secondaryHeaderColor: lightColor,
    shadowColor: lightColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    //
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: mainColor,
      elevation: 5.0,
      selectedIconTheme:IconThemeData(color: blackColor),
      unselectedIconTheme:IconThemeData(color: whiteColor),
    ),
    //
    textTheme: CustomTextTheme.textThemeLight,
    //
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
      scrimColor: greyColor,
    ),
    //
    iconTheme: const IconThemeData(color: blackColor),
    //
    appBarTheme: const AppBarTheme(
      backgroundColor: mainColor,
        foregroundColor:blackColor,
      iconTheme: IconThemeData(color: blackColor, size: 30),
      elevation: 0.0,
      shadowColor: blackColor,
      centerTitle: false,
    ),
    //
    dialogTheme: const DialogTheme(
      backgroundColor: whiteColor,
      elevation: 0.0,
      alignment: Alignment.center,
      iconColor: mainColor,
      titleTextStyle: TextStyle(),
      contentTextStyle: TextStyle(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      )),
    ),
    //
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(382, 41),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: whiteColor,
      elevation: 0.4,
      backgroundColor: blackColor,
    )),
    //
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            foregroundColor: whiteColor,
            side: const BorderSide(color: greyColor),
            padding: const EdgeInsets.symmetric(vertical: 20))),
    //
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: whiteColor,
        labelColor: mainColor,
        labelStyle: TextStyle(color: mainColor),
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.transparent))),
    //
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        fillColor: whiteColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIconColor: mainColor,
        suffixIconColor: mainColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: mainColor)),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: greyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        prefixStyle: const TextStyle(color: mainColor)),
    //
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.9),
        borderRadius: BorderRadius.zero,
      ),
    ),
    //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: greyColor,
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    //
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        checkColor: MaterialStateProperty.all(whiteColor),
        fillColor: MaterialStateProperty.all(mainColor)),
    //
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(mainColor),
      trackColor: MaterialStateProperty.all(blackColor),
    ),
    //
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(mainColor)),
    //
    sliderTheme: const SliderThemeData(
        thumbColor: mainColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
    //
    popupMenuTheme: PopupMenuThemeData(
      color: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      shadowColor: blackColor,
      // surfaceTintColor:,
      textStyle: const TextStyle(color: blackColor),
      // labelTextStyle:,
      enableFeedback: true,
      // mouseCursor:,
    ),
  );
}
