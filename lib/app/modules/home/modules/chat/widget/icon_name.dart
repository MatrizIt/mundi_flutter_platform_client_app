import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class IconName extends StatelessWidget {
  final String name;
  const IconName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          child: Icon(Icons.person),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: context.textStyles.titleBold.copyWith(fontSize: 14),
        )
      ],
    );
  }
}
