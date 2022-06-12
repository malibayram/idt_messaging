import 'package:flutter/material.dart';

part 'app_colors.dart';

abstract class BaseColors {
  //theme
  MaterialColor get primary;
  MaterialColor get accent;
  //text
  Color get primaryText;
  Color get secondaryText;
  //extra
  Color get white;
  Color get black;
  Color get green;
}
