import 'package:flutter/cupertino.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

import '../../../../../models/messages.dart';

class SenderWidget extends StatelessWidget {
  const SenderWidget({
    super.key,
    required this.message,
  });

  final Message? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
      decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              ),
          border: Border.all(color: context.colors.secondary)),
      child: Text(
        message?.message ?? "",
        textAlign: TextAlign.center,
        style: context.textStyles.textInter,
      ),
    );
  }
}
