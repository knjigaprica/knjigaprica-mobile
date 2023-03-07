import 'package:flutter/material.dart';

import 'genres_controller.dart';
import 'newest_books_controller.dart';
import 'popular_books_controller.dart';
import 'redeem_voucher.dart';
import 'welcome_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeSection(),
          const SizedBox(
            height: 40,
          ),
          NewestBooksController(),
          const SizedBox(
            height: 40,
          ),
          GenresController(),
          const SizedBox(
            height: 48,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: RedeemVoucher(),
          ),
          const SizedBox(
            height: 48,
          ),
          PopularBooksController(),
          const SizedBox(
            height: 128,
          ),
        ],
      ),
    );
  }
}
