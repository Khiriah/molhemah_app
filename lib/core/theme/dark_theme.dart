import 'package:advisor/core/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_theme.dart';

ThemeData darkThemeData() {
  return ThemeData(
    fontFamily: GoogleFonts.ubuntu.toString(),
    primaryColor: darkColor,
    cardColor: darkGreyColor,
    highlightColor: darkGreyColor,
    splashColor: Colors.transparent,
    canvasColor: lightColor,
    dialogBackgroundColor: darkColor,
    disabledColor: darkColor,
    dividerColor: lightColor,
    focusColor: lightColor,
    hintColor: lightColor,
    hoverColor: darkGreyColor,
    indicatorColor: lightColor,
    primaryColorDark: darkColor,
    secondaryHeaderColor: darkColor,
    shadowColor: lightColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkColor,
    //
    textTheme: CustomTextTheme.textThemeDark,
    //
    iconTheme: const IconThemeData(color: whiteColor),
    //
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme:IconThemeData(color: mainColor),
      unselectedIconTheme:IconThemeData(color: whiteColor),
    ),
    //
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      shadowColor: mainColor,
      iconTheme: IconThemeData(color: whiteColor, size: 30),
      centerTitle: false,
    ),
    //
    dialogTheme: const DialogTheme(
      backgroundColor: darkColor,
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
      foregroundColor: darkColor,
      elevation: 0.4,
      backgroundColor: mainColor,
    )),
    //
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            foregroundColor: greyColor,
            side:  const BorderSide(color: greyColor),
            padding: const EdgeInsets.symmetric(vertical: 20))),
    //
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: whiteColor,
        labelColor: mainColor,
        labelStyle: TextStyle(color: mainColor),
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: lightColor))),
    //
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        fillColor: darkColor,
        border: OutlineInputBorder(
          borderSide:const BorderSide(color: lightColor) ,
            borderRadius: BorderRadius.circular(10)),
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
            color: lightColor,
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
        backgroundColor: darkColor,
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
        checkColor: MaterialStateProperty.all(darkColor),
        fillColor: MaterialStateProperty.all(mainColor)),
    //
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(mainColor),
      trackColor: MaterialStateProperty.all(whiteColor)),
    //
    radioTheme:
        RadioThemeData(fillColor: MaterialStateProperty.all(mainColor)),
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
      shadowColor: lightColor,
      // surfaceTintColor:,
      textStyle: const TextStyle(color: whiteColor),
      // labelTextStyle:,
      enableFeedback: true,
      // mouseCursor:,
    ),
  );
}
