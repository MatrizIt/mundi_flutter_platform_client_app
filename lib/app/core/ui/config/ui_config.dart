import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';

class UiConfig {
  static String get title => 'Mundi Freelancer App';

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    primaryColor: ColorsApp.i.primary,
    primaryColorLight: ColorsApp.i.white,
  );
}