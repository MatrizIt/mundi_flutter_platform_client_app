import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/modules/notification/widgets/option_switch.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notificações",
                style: context.textStyles.titleBold.copyWith(
                  color: context.colors.primary,
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  Modular.to.pop();
                },
                child: Icon(
                  Icons.close,
                  color: context.colors.secondary,
                  size: 25,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const OptionSwitch(
            label: 'Ativar notificações',
          ),
          const SizedBox(
            height: 20,
          ),
          const OptionSwitch(
            label: 'Notificar por SMS',
          ),
          const SizedBox(
            height: 20,
          ),
          const OptionSwitch(
            label: 'Notificar por E-mail',
          ),
        ],
      ),
    );
  }
}
