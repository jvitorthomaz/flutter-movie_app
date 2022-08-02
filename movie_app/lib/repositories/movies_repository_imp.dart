import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/utils/api_utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);
  @override
  Future<Movies> getMovies({int? page}) async {
    try {
      var result = await _dioService.getDio().get(
            page != null
                ? API.REQUEST_MOVIE_LIST + '&page=$page'
                : API.REQUEST_MOVIE_LIST + '&page=1',
          );
      var data = Movies.fromJson(result.data);
      return data;
    } catch (e) {
      throw Exception("Erro ao buscar dados");
    }
  }
}
