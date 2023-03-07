import 'package:flutter/material.dart';

import '../../features/books/presentation/home/home_search_books.dart';
import '../../features/vouchers/presentation/home_redeem_voucher.dart';
import 'genres_controller.dart';
import 'newest_books_controller.dart';
import 'popular_books_controller.dart';
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
            child: HomeRedeemVoucher(),
          ),
          const SizedBox(
            height: 48,
          ),
          PopularBooksController(),
          const SizedBox(
            height: 48,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeSearchBooks(),
          ),
          const SizedBox(
            height: 128,
          ),
        ],
      ),
    );
  }
}
