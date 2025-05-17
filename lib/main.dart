import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/app_module.dart';
import 'package:mundi_flutter_platform_client_app/app/app_widget.dart';
import 'package:mundi_flutter_platform_client_app/app/core/config/application_config.dart';

void main() async {
  await ApplicationConfig().configure();

  FlutterError.onError = (details) {
    debugPrint("Erro no Flutter (Skia): ${details.exception}");
  };
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}