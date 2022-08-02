import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/decorators/movies_cache_repository_decorator.dart';
import 'package:movie_app/decorators/movies_repository_decorator.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<DioService>(create: (context) => DioServiceImp()),
        Provider<MoviesRepository>(
            create: (context) => MoviesRepositoryImp(context.read())),
        Provider<MoviesRepositoryDecorator>(
            create: (context) =>
                MoviesCacheRepositoryDecorator(context.read())),
        Provider(create: (context) => MovieController(context.read())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}
