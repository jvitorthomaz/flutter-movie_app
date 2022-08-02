import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

void main() async {
  var repository = MoviesRepositoryMock();

  when(() => repository.getMovies()).thenAnswer(
    (_) => Future.value(Movies.fromJson(jsonDecode(movie))),
  );

  when(() => repository.getMovies(page: 3)).thenAnswer(
    (_) => Future.value(Movies.fromJson(jsonDecode(moviePage3))),
  );

  final list = await repository.getMovies();
  final listPage3 = await repository.getMovies(page: 3);

  test('shold not be null', () {
    expect(list, isNotNull);
  });

  test('shold return Movies', () {
    expect(list, isA<Movies>());
  });

  test('shold return page 1', () {
    expect(list.page, 1);
  });

  test('shold return page 3', () async {
    expect(listPage3.page, 3);
  });

  test('shold return a list of Movie', () async {
    expect(list.listMovie, isA<List<Movie>>());
  });

  test('shold return the first movie title on page 1', () async {
    expect(list.listMovie?.first.title, "Spider-Man: No Way Home");
  });

  test('shold return the last movie popularity on page 1', () async {
    expect(list.listMovie?.last.popularity, "626.208");
  });

  test('shold return the first movie title on page 3', () async {
    expect(listPage3.listMovie?.first.title, "Spider-Man 3");
  });
}

const movie = ''' 
            {
    "average_rating": 6.04565,
    "backdrop_path": "/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg",
    "comments": {        
    },
    "created_by": {
    },
    "description": "The idea behind this list is to collect the live action comic book movies from within the Marvel franchise.",
    "id": 1,
    "iso_3166_1": "US",
    "iso_639_1": "en",
    "name": "The Marvel Universe",
    "object_ids": {        
    },
    "page": 1,
    "poster_path": "/coJVIUEOToAEGViuhclM7pXC75R.jpg",
    "public": true,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 634649,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Spider-Man: No Way Home",
            "overview": "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
            "popularity": 4816.033,
            "poster_path": "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
            "release_date": "2021-12-15",
            "title": "Spider-Man: No Way Home",
            "video": false,
            "vote_average": 8.1,
            "vote_count": 13011
        },
        {
            "adult": false,
            "backdrop_path": "/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg",
            "genre_ids": [
                878,
                28,
                12
            ],
            "id": 524434,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Eternals",
            "overview": "The Eternals are a team of ancient aliens who have been living on Earth in secret for thousands of years. When an unexpected tragedy forces them out of the shadows, they are forced to reunite against mankind’s most ancient enemy, the Deviants.",
            "popularity": 626.208,
            "poster_path": "/bcCBq9N1EMo3daNIjWJ8kYvrQm6.jpg",
            "release_date": "2021-11-03",
            "title": "Eternals",
            "video": false,
            "vote_average": 7.1,
            "vote_count": 5592
        }
    ],
    "revenue": 22376320295,
    "runtime": 5734,
    "sort_by": "primary_release_date.desc",
    "total_pages": 3,
    "total_results": 2
}
''';

const moviePage3 = ''' 
            
    {
    "average_rating": 6.04565,
    "backdrop_path": "/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg",
    "comments": {
    },
    "created_by": {
    },
    "description": "The idea behind this list is to collect the live action comic book movies from within the Marvel franchise.",
    "id": 1,
    "iso_3166_1": "US",
    "iso_639_1": "en",
    "name": "The Marvel Universe",
    "object_ids": {
    },
    "page": 3,
    "poster_path": "/coJVIUEOToAEGViuhclM7pXC75R.jpg",
    "public": true,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/6MQmtWk4cFwSDyNvIgoJRBIHUT3.jpg",
            "genre_ids": [
                14,
                28,
                12
            ],
            "id": 559,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Spider-Man 3",
            "overview": "The seemingly invincible Spider-Man goes up against an all-new crop of villains—including the shape-shifting Sandman. While Spider-Man’s superpowers are altered by an alien organism, his alter ego, Peter Parker, deals with nemesis Eddie Brock and also gets caught up in a love triangle.",
            "popularity": 103.654,
            "poster_path": "/qFmwhVUoUSXjkKRmca5yGDEXBIj.jpg",
            "release_date": "2007-05-01",
            "title": "Spider-Man 3",
            "video": false,
            "vote_average": 6.4,
            "vote_count": 11626
        },
        {
            "adult": false,
            "backdrop_path": "/ohfWCHT65P7b3kQvZnoy2BL95MB.jpg",
            "genre_ids": [
                53,
                28,
                14
            ],
            "id": 1250,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Ghost Rider",
            "overview": "In order to save his dying father, young stunt cyclist Johnny Blaze sells his soul to Mephistopheles and sadly parts from the pure-hearted Roxanne Simpson, the love of his life. Years later, Johnny's path crosses again with Roxanne, now a go-getting reporter, and also with Mephistopheles, who offers to release Johnny's soul if Johnny becomes the fabled, fiery 'Ghost Rider'.",
            "popularity": 46.134,
            "poster_path": "/8LaVQiXBsnlo7MXCPK1nXTVARUZ.jpg",
            "release_date": "2007-01-15",
            "title": "Ghost Rider",
            "video": false,
            "vote_average": 5.5,
            "vote_count": 4878
        }
    ],
    "revenue": 22376320295,
    "runtime": 5734,
    "sort_by": "primary_release_date.desc",
    "total_pages": 3,
    "total_results": 59
}

''';
