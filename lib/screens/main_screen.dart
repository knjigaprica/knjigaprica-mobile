import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/player/player_template.dart';
import '../../providers/navigation_provider.dart';
import '../../widgets/home/home_template.dart';
import '../../widgets/library/library_template.dart';
import '../../widgets/profile/profile_template.dart';
import '../../widgets/search/search_template.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlayerTemplate(body: Center(
      child: Consumer<NavigationProvider>(
        builder: (context, navigation, child) {
          switch (navigation.current) {
            case NavigationItem.home:
              return const HomeTemplate();
            case NavigationItem.search:
              return const SearchTemplate();
            case NavigationItem.library:
              return const LibraryTemplate();
            case NavigationItem.profile:
              return const ProfileTemplate();
          }
        },
      ),
    ));
  }
}
