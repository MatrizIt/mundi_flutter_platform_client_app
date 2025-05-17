import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';

class DefaultPadding extends StatelessWidget {
  final Widget? child;
  final String bgImagePath;
  const DefaultPadding({
    super.key,
    required this.bgImagePath,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.statusBar + 28),
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            bgImagePath,
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: child,
    );
  }
}
