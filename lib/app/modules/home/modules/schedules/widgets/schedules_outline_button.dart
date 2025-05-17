import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class SchedulesOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const SchedulesOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.colors.secondary,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          label,
          style: context.textStyles.textMedium.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
