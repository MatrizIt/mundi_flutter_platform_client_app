import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/widget/icon_name.dart';

class HeaderChat extends StatelessWidget {
  const HeaderChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IconName(name: 'Entrepreneur'),
                Image.asset('assets/images/close_png.png')
              ],
            ),
          ),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
