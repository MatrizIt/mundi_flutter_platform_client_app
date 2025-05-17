import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class ProfileTile extends StatelessWidget {
  final String name;
  const ProfileTile({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 22.5),
        const SizedBox(
          width: 10,
        ),
        Text(
          name ?? "usuario",
          style: context.textStyles.titleBold.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
