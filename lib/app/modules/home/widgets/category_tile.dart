import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final String image;
  const CategoryTile({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .3.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colors.decorationPrimary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textStyles.textMedium.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
