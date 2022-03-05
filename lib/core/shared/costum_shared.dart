import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF292F3B);
const Color secondaryColor = Color(0xFF252635);
const Color tertiaryColor = Color(0xFFcc324b);
const Color whiteColor = Color(0xFFffffff);
final costumThemeData = ThemeData(
  primaryColorLight: const Color(0xFF3BDAED),
  unselectedWidgetColor: Colors.grey[300],
  appBarTheme: const AppBarTheme(
    backgroundColor: whiteColor,
    elevation: 1,
    titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 3,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  ),
  primaryColor: primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      primary: primaryColor,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 10),
        borderRadius: BorderRadius.circular(16),
      ),
      primary: primaryColor,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: whiteColor,
    focusColor: whiteColor,
    hoverColor: whiteColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 30),
    headline2: TextStyle(fontSize: 28),
    headline3: TextStyle(fontSize: 26),
    headline4: TextStyle(fontSize: 24),
    headline5: TextStyle(fontSize: 22),
    headline6: TextStyle(fontSize: 20),
    subtitle1: TextStyle(fontSize: 18),
    subtitle2: TextStyle(fontSize: 16),
    bodyText1: TextStyle(fontSize: 14),
    bodyText2: TextStyle(fontSize: 12),
    caption: TextStyle(fontSize: 10),
  ),
);
