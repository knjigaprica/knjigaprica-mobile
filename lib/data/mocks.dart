import 'package:flutter/material.dart';

class _Book {
  final String title;
  final String author;
  final String imageUrl;

  const _Book(
      {required this.title, required this.author, required this.imageUrl});
}

class _Genre {
  final String name;
  final IconData icon;

  const _Genre({required this.name, required this.icon});
}

class DataMock {
  // ignore: library_private_types_in_public_api
  static List<_Book> homeScreenNewestBooks = const [
    _Book(
      title: 'Ecce homo',
      author: 'Fridrih Niče',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/Ecce%20homo.png',
    ),
    _Book(
      title: 'Kao leto',
      author: 'Vesna Dedić',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/kao_leto_vv.jpg',
    ),
    _Book(
      title: 'Autobiografija',
      author: 'Branislav Nušić',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/AUTOBIOGRAFIJA.png',
    ),
    _Book(
      title: 'Sa pašnjaka do naučenjaka',
      author: 'Mihajlo I. Pupin',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/sa%20pasnjaka%20-%20cover.png',
    ),
  ];

  // ignore: library_private_types_in_public_api
  static List<_Genre> homeScreenGenres = const [
    _Genre(name: 'Lektire', icon: Icons.menu_book_sharp),
    _Genre(name: 'Drama', icon: Icons.theater_comedy),
    _Genre(name: 'Komedija', icon: Icons.tag_faces_sharp),
    _Genre(name: 'Klasici', icon: Icons.business_outlined),
    _Genre(name: 'Biznis', icon: Icons.business_center_outlined),
    _Genre(name: 'Triler', icon: Icons.attractions),
  ];
}
