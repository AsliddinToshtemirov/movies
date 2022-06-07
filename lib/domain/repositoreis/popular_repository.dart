import 'package:movies/core/utils/constants.dart';
import 'package:movies/domain/services/base_services.dart';
import 'package:movies/domain/services/popular_service.dart';
import 'package:movies/domain/services/movie.dart';

class PopularRepository {
  final BaseService _popularService = PopularService();

  Future<List<Movie>> fetchPopular() async {
    dynamic response = await _popularService.getResponse(popular);

    final data = response["results"] as List;

    List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();
    print(data);

    return movies;
  }
}
