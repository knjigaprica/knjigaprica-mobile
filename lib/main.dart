import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../shared/main/main_template.dart';
import 'features/book/data/books_repository.dart';
import 'features/book/data/genres_repository.dart';
import 'features/book/data/implementation/fake_books_repository.dart';
import 'features/book/data/implementation/fake_genres_repository.dart';
import 'routing/routes.dart';
import 'utils/constants/color_pallete.dart';

void main() {
  // Allow only portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  registerRepositories();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Knjigaprica',
        theme: ThemeData(
            fontFamily: Platform.isAndroid ? 'Roboto' : 'SF Pro Display',
            colorScheme: ColorPallete.appColorScheme,
            scaffoldBackgroundColor: ColorPallete.backgroundColor),
        home: const MainTemplate(),
        routes: ApplicationRoutes.getRoutes());
  }
}

void registerRepositories() {
  GetIt.instance
      .registerLazySingleton<BooksRepository>(() => FakeBooksRepository());
  GetIt.instance
      .registerLazySingleton<GenresRepository>(() => FakeGenresRepository());
}
