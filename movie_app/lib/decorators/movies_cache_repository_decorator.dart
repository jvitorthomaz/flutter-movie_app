import 'dart:convert';
import 'package:movie_app/decorators/movies_repository_decorator.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<Movies> getMovies({int? page}) async {
    try {
      Movies movies = await super.getMovies(page: page);
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    String? jsonMovies = prefs.getString('movies_cache');
    var json = jsonDecode(jsonMovies!);
    var movies = Movies.fromJson(json);
    return movies;
  }
}
