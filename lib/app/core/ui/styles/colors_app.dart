import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff060E31);

  Color get white => const Color(0xffF3F4F6);

  Color get secondary => const Color(0xff40B64B);
  Color get secondary4 => const Color(0xffF3F4F6);

  Color get grey => Colors.grey.shade500;

  Color get darkGrey => const Color(0xff353839);

  Color get decorationPrimary => const Color.fromRGBO(64, 182, 75, 1);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
