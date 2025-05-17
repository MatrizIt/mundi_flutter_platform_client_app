import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/image_snapping.dart';

import '../../../../../../models/work.dart';

class PortfolioPage extends StatefulWidget {
  final List<Uint8List> fetchedImages;
  final List<Work> services;
  const PortfolioPage({
    super.key,
    required this.services,
    required this.fetchedImages
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 50,
                );
              },
              shrinkWrap: true,
              itemCount: widget.services.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final service = widget.services[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSnapping(fetchedImages: widget.fetchedImages,),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      service.title,
                      style: context.textStyles.textMedium.copyWith(
                        color: const Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      service.description,
                      style: context.textStyles.textRegular.copyWith(
                        color: const Color.fromRGBO(164, 164, 164, 1),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
