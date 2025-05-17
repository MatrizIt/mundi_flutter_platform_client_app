import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/modules/details/widgets/open_hours_tile.dart';

import '../../../../../../models/entrepreneur.dart';

class DetailsPage extends StatelessWidget {
  final String address;
  final String email;
  final String phone;
  final List<Operation> operation;
  const DetailsPage(
      {super.key,
      required this.address,
      required this.email,
      required this.phone,
      required this.operation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Endereço",
            style: context.textStyles.textMedium.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(33, 33, 33, 1),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            address,
            style: context.textStyles.textRegular.copyWith(
              color: const Color.fromRGBO(164, 164, 164, 1),
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Funcionamento",
            style: context.textStyles.textMedium.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(33, 33, 33, 1),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.separated(
                  itemBuilder: (context, index) => !operation[index].isActive
                      ? OpenHoursTile.closed(
                          day: operation[index].day,
                        )
                      : OpenHoursTile(
                          startAt: operation[index].openinHours,
                          endAt: operation[index].closingTime,
                          day: operation[index].day,
                        ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: operation.length)),
          Text(
            "Contato",
            style: context.textStyles.textMedium.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(33, 33, 33, 1),
            ),
          ),
          Text(
            phone,
            style: context.textStyles.textRegular.copyWith(
              color: const Color.fromRGBO(164, 164, 164, 1),
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            email,
            style: context.textStyles.textRegular.copyWith(
              color: const Color.fromRGBO(164, 164, 164, 1),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
