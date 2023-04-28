class movies {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  movies({this.page, this.results, this.totalPages, this.totalResults});

  factory movies.fromJson(Map<String, dynamic> json) {
    return movies(
      page: json['page'],
      results: json['results'] != null ? List<Results>.from(json['results'].map((x) => Results.fromJson(x))) : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results != null ? List<dynamic>.from(results!.map((x) => x.toJson())) : null,
    'total_pages': totalPages,
    'total_results': totalResults,
  };
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'] != null ? List<int>.from(json['genre_ids'].map((x) => x)) : null,
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds != null ? List<dynamic>.from(genreIds!.map((x) => x)) : null,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}
