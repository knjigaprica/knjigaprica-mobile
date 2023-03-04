import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_pallete.dart';
import '../application/navigation_provider.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  Widget _buildNavigationItem(
      IconData icon, String label, bool isSelected, VoidCallback? onTap) {
    Color color = isSelected
        ? ColorPallete.primaryColor
        : ColorPallete.unselectedNavigationItem;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: 48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 24,
              color: color,
            ),
            Text(
              label,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                  width: 1, color: ColorPallete.navigationTopBorder))),
      child: Consumer<NavigationProvider>(
        builder: (context, navigation, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavigationItem(
                  Icons.home_outlined,
                  'Početna',
                  navigation.current == NavigationItem.home,
                  () => navigation.switchNavigation(NavigationItem.home)),
              _buildNavigationItem(
                  Icons.search,
                  'Pretraži',
                  navigation.current == NavigationItem.search,
                  () => navigation.switchNavigation(NavigationItem.search)),
              _buildNavigationItem(
                  Icons.import_contacts_outlined,
                  'Moje knjige',
                  navigation.current == NavigationItem.library,
                  () => navigation.switchNavigation(NavigationItem.library)),
              _buildNavigationItem(
                  Icons.account_circle_outlined,
                  'Profil',
                  navigation.current == NavigationItem.profile,
                  () => navigation.switchNavigation(NavigationItem.profile))
            ]),
      ),
    );
  }
}
