import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get titleBold => const TextStyle(
        fontFamily: 'Nexa',
        fontWeight: FontWeight.w700,
      );

  TextStyle get buttonFont => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textLight => GoogleFonts.quicksand(
        fontWeight: FontWeight.w300,
      );

  TextStyle get textInter => GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: const Color(0xFFFFFFFF));

  TextStyle get textRegular => GoogleFonts.quicksand(
        fontWeight: FontWeight.w400,
      );

  TextStyle get textMedium => GoogleFonts.quicksand(
        fontWeight: FontWeight.w500,
      );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
