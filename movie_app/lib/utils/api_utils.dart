class API {
  static String REQUEST_IMG(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';

  /* 
  Todas as vezes que tentei buscar por outro parametro que não o de popularidade deu erro. 
  */
  static const REQUEST_MOVIE_LIST = 'discover/movie?sort_by=popularity.desc';
}
