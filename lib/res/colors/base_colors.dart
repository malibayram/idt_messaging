import 'package:flutter/material.dart';

part 'app_colors.dart';

abstract class BaseColors {
  //theme color
  MaterialColor get colorPrimary;
  MaterialColor get colorAccent;
  //text color
  Color get colorPrimaryText;
  Color get colorSecondaryText;
  //extra color
  Color get colorWhite;
  Color get colorBlack;
}
