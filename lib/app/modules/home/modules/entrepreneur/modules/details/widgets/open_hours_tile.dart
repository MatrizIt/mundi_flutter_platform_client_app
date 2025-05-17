import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class OpenHoursTile extends StatelessWidget {
  final String day;
  final String? startAt;
  final String? endAt;
  const OpenHoursTile({
    super.key,
    required this.day,
    required this.endAt,
    required this.startAt,
  });

  const OpenHoursTile.closed({
    super.key,
    required this.day,
  })  : startAt = null,
        endAt = null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: context.textStyles.textRegular.copyWith(
            color: const Color.fromRGBO(164, 164, 164, 1),
            fontSize: 10,
          ),
        ),
        Container(
          width: 100,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              color: startAt == null ? Colors.red : context.colors.secondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            startAt != null ? '${startAt}h às ${endAt}h' : "Fechado",
            style: context.textStyles.titleBold.copyWith(
              fontSize: 8,
              color: startAt == null ? Colors.red : context.colors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
