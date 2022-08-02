import 'package:dio/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', headers: {
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NzEyOTI1MWIxMTExNzYyNmU1Yzg5YmFhZDJmODA5MyIsInN1YiI6IjYyZGM0MDZlZWE4NGM3MDA0ZmM2MDkzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.m7xK5n-qfbPjCRpcXOJVoLWvZZFBIbwBhdTop5gez1E',
      }, queryParameters: {
        'language': 'pt-BR'
      }),
    );
  }
}
