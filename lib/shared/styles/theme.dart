import 'package:flutter/material.dart';

import 'colors.dart';

class ThemesApp {
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: SharedColor.primary,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.black,
      error: Colors.white,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.white,
      surface: Colors.black,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: SharedColor.primary,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: SharedColor.primary,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: SharedColor.primaryDark,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      background: SharedColor.darkGreyClr,
      onBackground: SharedColor.darkGreyClr,
      surface: SharedColor.primaryDark,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: SharedColor.darkGreyClr,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: SharedColor.darkGreyClr,
    ),
  );
}
