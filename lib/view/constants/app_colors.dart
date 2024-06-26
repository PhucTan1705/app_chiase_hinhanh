import 'package:chiase_hinhanh/extentions/string/as_html_color_to_color.dart';
import 'package:flutter/foundation.dart'show immutable;
import 'package:flutter/material.dart' show Colors;

@immutable
class AppColors {
  static final loginButtonColor = '#cfc9c2'.htmlColorToColor();
  static const loginButtonTextColor= Colors.black;
  static final googleColor = '#4285F4'.htmlColorToColor();
  static final facebookColor = '#3b5998'.htmlColorToColor();
  const AppColors._();
}