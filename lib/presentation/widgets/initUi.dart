import 'package:flutter/widgets.dart';
import 'package:movies/core/utils/constants.dart';
import 'package:movies/data/models/detail.dart';

Widget initUi(Details details) {
  return Column(
    children: [Image.network("$imageUrl${details.posterPath}")],
  );
}
