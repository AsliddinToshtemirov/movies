import 'package:movies/data/models/detail.dart';
import 'package:movies/domain/services/base_services.dart';
import 'package:movies/domain/services/details_service.dart';

class DetailsRepository {
  final BaseService _detailsService = DetailsService();

  Future<Details> fetchDetails(int movieId) async {
    dynamic response = await _detailsService.getResponse(movieId.toString());
    final details = response as Details;

    print(response);
    return details;
  }
}
