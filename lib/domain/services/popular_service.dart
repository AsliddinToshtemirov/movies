import 'dart:convert';
import 'dart:io';

import 'package:movies/core/error/app_exception.dart';
import 'package:movies/core/utils/constants.dart';
import 'package:movies/domain/services/base_services.dart';
import 'package:http/http.dart' as http;

class PopularService extends BaseService {
  dynamic responseJson;
  @override
  Future getResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url + apiKey));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("enternet error ");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());

      case 401:
        throw UnauthorizedException(response.statusCode.toString());

      case 404:
        throw PageNotFoundException(response.statusCode.toString());
      default:
        throw Exception(response.statusCode.toString());
    }
  }
}
