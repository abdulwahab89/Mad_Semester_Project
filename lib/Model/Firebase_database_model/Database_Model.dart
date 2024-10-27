enum MovieCategory{
horror,
  fiction,
  comedy,
  action,
  drama,
  romance,
  thriller,
  crime,
}
class DatabaseModel {
  String? id;
  String? imageUrl;
  String? cover_url;
  String? description;
  String? movieName;
  String? movieRating;
  MovieCategory? movieCategory;
  String? movieYear;
  String? movieReview;

  // Constructor
  DatabaseModel({
    this.id,
    this.imageUrl,
    this.description,
    this.movieCategory,
    this.movieName,
    this.cover_url,
    this.movieReview,
    this.movieRating,
    this.movieYear,
  });

  factory DatabaseModel.fromMap(Map<dynamic, dynamic> map) {
    return DatabaseModel(
      id: map['id'],
      movieReview: map['movieReview'],
      cover_url: map['cover_url'],
      movieCategory: _getMovieCategory(map['category']),
      imageUrl: map['imageUrl'],
      description: map['movie_description'],
      movieName: map['movieName'],
      movieRating: map['movie_rating'],
      movieYear: map['movie_year'],
    );
  }
  static MovieCategory _getMovieCategory(String? category) {
    return MovieCategory.values.firstWhere(
          (e) => e.toString().split('.').last == category,
      orElse: () => MovieCategory.horror,
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'imageUrl':imageUrl,
      'movieName':movieName,
      'movie_description':description,
      'movie_rating':movieRating,
      'movie_year':movieYear,
      'category': movieCategory.toString().split('.').last,
    'cover_url':cover_url,
      'movieReview':movieReview,
    };
  }
}
