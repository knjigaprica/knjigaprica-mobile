
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation_provider.dart';
import '../../helpers/constants/color_pallete.dart';

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
    var currentNavigation = Provider.of<NavigationProvider>(context).current;
    var switchNavigation =
        Provider.of<NavigationProvider>(context, listen: false)
            .switchNavigation;
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1, color: ColorPallete.navigationTopBorder))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavigationItem(
                Icons.home_outlined,
                "Početna",
                currentNavigation == NavigationItem.home,
                () => switchNavigation(NavigationItem.home)),
            _buildNavigationItem(
                Icons.search,
                "Pretraži",
                currentNavigation == NavigationItem.search,
                () => switchNavigation(NavigationItem.search)),
            _buildNavigationItem(
                Icons.import_contacts_outlined,
                "Moje knjige",
                currentNavigation == NavigationItem.library,
                () => switchNavigation(NavigationItem.library)),
            _buildNavigationItem(
                Icons.account_circle_outlined,
                "Profil",
                currentNavigation == NavigationItem.profile,
                () => switchNavigation(NavigationItem.profile))
          ]),
    );
  }
}
