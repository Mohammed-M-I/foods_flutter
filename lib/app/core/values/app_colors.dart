import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xff891820);
  static const Color white = Color(0xffffffff);
  static const Color orange = Color(0xffe7831c);
  static const Color green = Color(0xff09964b);
  static const Color red = Color(0xff891820);

  static const Color primaryRipple = Color(0x88891820);

  static const Color black01 = Color(0xFF000000);
  static const Color white01 = Color(0xFFFFFFFF);
  static const Color gray01 = Color(0xEEEEEEFF);
  static const Color gray02 = Color(0xEEB4B4BA);
  static const Color gray03 = Color(0x990A0202);

  static const Color red01 = Color(0x93670707);
  static const Color green01 = Color(0x93076714);
  static const Color yellow01 = Color(0x93F8EF00);
  static const Color blue01 = Color(0x930051A8);
  static const Color pink01 = Color(0x93DE32DA);
  static const Color purple01 = Color(0x934E037C);

  static const LinearGradient linearGradient01 = LinearGradient(
    colors: [
      Color(0xFF496AE1),
      Color(0xFFCE48B1),
    ],
  );

  static const LinearGradient linearGradient02 = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.black87,
      Colors.black26,
      Colors.transparent,
    ],
  );
}