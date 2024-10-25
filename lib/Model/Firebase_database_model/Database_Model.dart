enum MovieCategory{
Horror,
  Fiction,
  Comedy,
  Action,
  Drama,
  Romance,
  Thriller,
  Crime,
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

  // Constructor
  DatabaseModel({
    this.id,
    this.imageUrl,
    this.description,
    this.movieCategory,
    this.movieName,
    this.cover_url,
    this.movieRating,
    this.movieYear,
  });

  factory DatabaseModel.fromMap(Map<dynamic, dynamic> map) {
    return DatabaseModel(
      id: map['id'], // Use the provided ID for the item
      cover_url: map['cover_url'],
      movieCategory: MovieCategory.values.firstWhere((e) => e.toString() == 'MovieCategory.${map['category']}'),
      imageUrl: map['imageUrl'], // Access the 'imageUrl' field from the map
      description: map['movie_description'], // Access the 'description' field from the map
      movieName: map['movieName'], // Access the 'movieName' field from the map
      movieRating: map['movie_rating'], // Access the 'movieRating' field from the map
      movieYear: map['movie_year'], // Access the 'movieYear' field from the map
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
    };
  }
}
