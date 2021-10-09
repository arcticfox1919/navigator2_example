import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nav2_demo/models/movie.dart';

abstract class Service {
  static Future<List<Movie>> fetchMovieList() async {
    var data = await rootBundle.loadString('assets/data.json');
    final List list = jsonDecode(data);

    return list.map<Movie>((e) {
      return Movie.fromJson(e);
    }).toList();
  }
}
