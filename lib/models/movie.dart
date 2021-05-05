class Movie {
  final String title;
  final double vote_average;
  final String poster_path;
  final String overview;
  final int id;

  Movie(
      {this.title,
      this.vote_average,
      this.poster_path,
      this.overview,
      this.id});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        vote_average: json["vote_average"],
        poster_path: json["poster_path"],
        overview: json["overview"],
        id: json["id"]);
  }
}
