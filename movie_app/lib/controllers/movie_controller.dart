import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  static int _page = 1;
  Movies? _cachedMovies;
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);
  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  ScrollController scrollController = ScrollController();

  infiniteScrolling() {
    if (scrollController.position.pixels + 350 >=
            scrollController.position.maxScrollExtent &&
        loading.value == false) {
      _page++;
      fetch();
    }
  }

  onRefresh() async {
    _page = 1;
    fetch();
  }

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovie!
        .where(
          (element) => element.title!.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovie: list);
  }

  fetch() async {
    loading.value = true;

    final data = await _moviesRepository.getMovies(page: _page);

    _cachedMovies?.listMovie!.addAll(data.listMovie!);

    movies.value != null && _page != 1
        ? movies.value = data.copyWith(listMovie: _cachedMovies!.listMovie)
        : movies.value = data;

    _cachedMovies = movies.value;
    loading.value = false;
  }
}
