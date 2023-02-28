import 'package:flutter/material.dart';

import '../../widgets/home/book_list.dart';
import 'welcome_section.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          WelcomeSection(),
          SizedBox(
            height: 40,
          ),
          BookList(title: 'Najnovije'),
          SizedBox(
            height: 5000,
          ),
        ],
      ),
    );
  }
}
