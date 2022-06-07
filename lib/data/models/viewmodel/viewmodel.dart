import 'package:flutter/material.dart';
import 'package:movies/core/api/api_response.dart';
import 'package:movies/domain/repositoreis/popular_repository.dart';
import 'package:movies/domain/services/movie.dart';

class MainViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("initial");
  List<Movie> _movies = [];

  List<Movie> get movies {
    return _movies;
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Future fetchPopular() async {
    try {
      List<Movie> movies = await PopularRepository().fetchPopular();
      _movies = movies;
      _apiResponse = ApiResponse.complated(movies);
    } catch (e) {
      _apiResponse = ApiResponse.error("error");
    }
    notifyListeners();
  }
}
