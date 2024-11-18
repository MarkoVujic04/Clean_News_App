import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(context),
  );
}

AppBarTheme appBarTheme(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;

  return AppBarTheme(
    color: const Color(0xFF1E2A39),
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * 0.05, 
    ),
  );
}
