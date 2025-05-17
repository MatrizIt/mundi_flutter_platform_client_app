import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';

class GradientDivider extends StatelessWidget {
  final List<Color> colors;
  const GradientDivider({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .25.sw,
      height: 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 1],
          colors: colors,
        ),
      ),
    );
  }
}