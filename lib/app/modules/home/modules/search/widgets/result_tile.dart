import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/image_snapping.dart';

import '../../../../../models/entrepreneur.dart';
import 'package:http/http.dart' as http;

class ResultTile extends StatefulWidget {
  const ResultTile({super.key, required this.entrepreneur});

  final Entrepreneur entrepreneur;

  @override
  State<ResultTile> createState() => _ResultTileState();
}

class _ResultTileState extends State<ResultTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageSnapping.favorite(
          fetchedImages: widget.entrepreneur.imagesID ?? [],
        ),
        const SizedBox(height: 10),
        Text(
          widget.entrepreneur.name,
          style: context.textStyles.textMedium.copyWith(
            fontSize: 14,
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.entrepreneur.fullAddress,
                maxLines: 4,
                textAlign: TextAlign.left,
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 10,
                  color: const Color.fromRGBO(164, 164, 164, 1),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 8,
                  color: context.colors.decorationPrimary,
                ),
                const SizedBox(width: 5),
                Text(
                  '0',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.decorationPrimary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.entrepreneur.distance} km  Jul 4",
              style: context.textStyles.textRegular.copyWith(
                fontSize: 14,
                color: const Color.fromRGBO(113, 113, 113, 1),
              ),
            ),
            GestureDetector(
              onTap:
                  () => Modular.to.pushNamed(
                    '/home/entrepreneur/',
                    arguments: widget.entrepreneur.id,
                  ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(221, 221, 221, 1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  "Agende Aqui",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
