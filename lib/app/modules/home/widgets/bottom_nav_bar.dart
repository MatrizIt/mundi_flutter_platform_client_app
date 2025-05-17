import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int index) onChangePage;
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.onChangePage,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: context.colors.decorationPrimary,
      onTap: onChangePage,
      elevation: 0.0,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Image.asset(
            'assets/images/home.png',
            fit: BoxFit.contain,
            height: 46,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Pesquisa',
          icon: Image.asset(
            'assets/images/search.png',
            fit: BoxFit.contain,
            height: 18,
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Agenda',
          icon: Icon(
            Icons.calendar_month_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Perfil',
          icon: Icon(
            Icons.person_outline_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
