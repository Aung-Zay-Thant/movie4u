class Movie {
  String title;
  String imageURL;
  String summary;
  dynamic imdb;
  String webURL;

  Movie({this.title, this.imageURL, this.summary,this.imdb,this.webURL});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title_english'];
    imageURL = json['medium_cover_image'];
    summary = json['summary'];
    imdb = json['rating'];
    webURL = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> movies = new Map<String, dynamic>();
    movies['title_english'] = this.title;
    movies['medium_cover_image'] = this.imageURL;
    movies['summart'] = this.summary;
    movies['rating'] = this.imdb;
    movies['url'] = this.webURL;
    return movies;
  }
}

class MovieList {
  int movieCount;
  int pageNumber;
  int limit;
  List<Movie> movie;

  MovieList({this.movieCount, this.pageNumber, this.limit, this.movie});

  MovieList.fromJson(Map<String, dynamic> json) {
    movieCount = json['data']['movie_count'];
    pageNumber = json['data']['page_number'];
    limit = json['data']['limit'];
    if (json['data']['movies'] != null) {
      movie = List<Movie>();
      json['data']['movies'].forEach((v) {
        movie.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> movies = new Map<String, dynamic>();
    movies['data']['movie_count'] = this.movieCount;
    movies['data']['page_number'] = this.pageNumber;
    movies['data']['limit'] = this.limit;
    if (this.movie != null) {
      movies['data']['movies'] = this.movie.map((v) => v.toJson()).toList();
    }
    return movies;
  }
}
