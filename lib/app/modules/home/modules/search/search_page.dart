import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/filter_widget.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/gradient_text_field.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/horizontal_entrepreneurs_list.dart';

import '../../../../models/entrepreneur.dart';
import 'widgets/result_tile.dart';

class SearchPage extends StatefulWidget {
  final List<Entrepreneur> specialOffers;
  const SearchPage({
    super.key,
    required this.specialOffers,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  final whereController = TextEditingController();
  final whenController = TextEditingController();

  final servicesFilters = [
    'Tudo',
    'Cabelereiro',
    'Salões de Beleza',
    'Spa & Massagem',
    'Esteticista',
    'Makeup',
    'Outros Serviços'
  ];

  String selectedFilter = 'Tudo';
  List<Entrepreneur> filteredOffers = [];

  @override
  void initState() {
    super.initState();
    filteredOffers = widget.specialOffers;

    searchController.addListener(_filterOffers);
  }



  @override
  void dispose() {
    searchController.removeListener(_filterOffers);
    searchController.dispose();
    whereController.dispose();
    whenController.dispose();
    super.dispose();
  }

  void _filterOffers() {
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredOffers = widget.specialOffers.where((entrepreneur) {
        return entrepreneur.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: .26.sh - 1.statusBar,
          color: const Color(0xFF060E31),
          padding: EdgeInsets.only(top: 1.statusBar + 10, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 31,
                  ),
                  Row(
                    children: [
                      Text(
                        "Meus Favoritos",
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: Color.fromRGBO(242, 242, 242, 1),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              GradientTextField(
                hintText: 'Pesquisa aqui a especialidade...',
                prefixIcon: Icons.search,
                controller: searchController,
              ),
              const SizedBox(
                height: 20,
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientTextField(
                    width: .38.sw,
                    height: 37,
                    radius: 14,
                    padding: EdgeInsets.zero,
                    contentPadding: const EdgeInsets.only(bottom: 13),
                    hintText: 'Onde',
                    prefixIcon: Icons.location_on_outlined,
                    controller: whereController,
                  ),
                  GradientTextField(
                    width: .38.sw,
                    height: 37,
                    radius: 14,
                    padding: EdgeInsets.zero,
                    contentPadding: const EdgeInsets.only(bottom: 13),
                    hintText: 'Quando',
                    prefixIcon: Icons.calendar_today,
                    controller: whenController,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
                width: 1.sw,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: servicesFilters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = servicesFilters[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: filter == selectedFilter
                              ? Border.all(
                            color: context.colors.decorationPrimary,
                            width: 1,
                          )
                              : null,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          filter,
                          style: context.textStyles.textRegular.copyWith(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: filter == selectedFilter
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalEntrepreneursList(
                    title: 'Ofertas Especiais',
                    entrepeneurs: filteredOffers,
                  ),
                  Text(
                    "Resultados",
                    style: context.textStyles.titleBold.copyWith(
                      fontSize: 20,
                      color: context.colors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const FilterWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 30,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: filteredOffers.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ResultTile(entrepreneur: filteredOffers[index],);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
