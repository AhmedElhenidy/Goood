import 'dart:ui';

import 'package:camel/statics/good_colors.dart';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = GoodColors.brown;
  static const Color loginGradientEnd =GoodColors.brownLight;


  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}