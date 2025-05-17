import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/models/entrepreneur.dart';
import 'package:mundi_flutter_platform_client_app/app/models/work.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/modules/services/widgets/modality_tile.dart';

class ServiceTile extends StatelessWidget {
  final Work service;
  final int entrepreneurId;
  final Entrepreneur entrepreneur;
  const ServiceTile(
      {super.key, required this.service, required this.entrepreneurId, required this.entrepreneur});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.title,
          style: context.textStyles.titleBold.copyWith(
            color: context.colors.primary,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: service.modalities.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final modality = service.modalities[index];
            return ModalityTile(
              entrepreneur: entrepreneur,
              modality: modality,
              entrepreneurId: entrepreneurId,
            );
          },
        ),
      ],
    );
  }
}
