import 'package:flutter/material.dart';
import 'package:movies/core/api/api_response.dart';
import 'package:movies/data/models/detail.dart';
import 'package:movies/domain/repositoreis/details_repository.dart';

class DetailsViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Initial");
  Details? _details;

  Details? get details {
    return _details;
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Future fetchDetailsById(int movieId) async {
    try {
      Details details = await DetailsRepository().fetchDetails(movieId);
      _details = details;

      ApiResponse.complated(_details);
    } catch (e) {
      ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
