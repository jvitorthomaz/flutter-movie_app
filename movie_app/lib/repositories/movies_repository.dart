import 'package:movie_app/models/movies_model.dart';

abstract class MoviesRepository {
 Future<Movies> getMovies({int? page});
}
