class Movie {
  String name, imgUrl;

  Movie.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imgUrl = json['img'];
}
