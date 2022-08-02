class Movies {
  Movies({
    required this.page,
    required this.listMovie,
    required this.totalPages,
    required this.totalResults,
  });
  late final int? page;
  late final List<Movie>? listMovie;
  late final int? totalPages;
  late final int? totalResults;

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    listMovie =
        List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = listMovie!.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }

  Movies copyWith({
    int? page,
    List<Movie>? listMovie,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      page: page ?? this.page,
      listMovie: listMovie ?? this.listMovie,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool? adult;
  late final String? backdropPath;
  late final List<int>? genreIds;
  late final int? id;
  late final String? originalLanguage;
  late final String? originalTitle;
  late final String? overview;
  late final String? popularity;
  late final String? posterPath;
  late final String? releaseDate;
  late final String? title;
  late final bool? video;
  late final String? voteAverage;
  late final int? voteCount;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'].toString();
    posterPath = json['poster_path'];
    releaseDate = json['release_date'].toString();
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}
