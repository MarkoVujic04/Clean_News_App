import 'package:flutter/material.dart';

class ScreenUtils {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio;
  }

  static double screenPaddingTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
