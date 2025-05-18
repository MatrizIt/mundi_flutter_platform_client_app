import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/models/entrepreneur.dart';

class EntrepreneurTile extends StatefulWidget {
  final Entrepreneur entrepreneur;
  final double stars;

  const EntrepreneurTile({
    super.key,
    required this.entrepreneur,
    required this.stars,
  });

  @override
  State<EntrepreneurTile> createState() => _EntrepreneurTileState();
}

class _EntrepreneurTileState extends State<EntrepreneurTile> {
  List<Uint8List> fetchedImages = [];


  Future<void> fetchImagesByEntrepreneurId(int entrepreneurId) async {
    const String baseUrl = 'https://api.mundiapp.com.br';
    final String url = '$baseUrl/images/byEntrepreneur/$entrepreneurId';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        final List<Uint8List> images = (decodedResponse as List)
            .map((item) {
          final base64String = item['base64'] as String;
          final base64Clean = base64String.split(',').last;
          return base64Decode(base64Clean);
        }).toList();

        setState(() {
          fetchedImages = images;
        });
      } else {
        print('Erro ao buscar imagens: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao conectar ao servidor: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchImagesByEntrepreneurId(widget.entrepreneur.id);
  }

  @override
  Widget build(BuildContext context) {
    print("O que está vindo? ${fetchedImages}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 275,
          height: 152,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: widget.entrepreneur.profileImage != null
                ? Image.memory(
              widget.entrepreneur.profileImage!,
              fit: BoxFit.cover,
            )
                : Image.asset(
              'assets/images/dark_logo.png',

            ),
          ),
        ),

        const SizedBox(
          height: 5,
        ),
        Text(
          widget.entrepreneur.name,
          style: context.textStyles.titleBold.copyWith(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.entrepreneur.fullAddress,
          style: context.textStyles.textRegular.copyWith(
            fontSize: 10,
            color: const Color(0xFFA4A4A4),
          ),
        ),
      ],
    );
  }
}
