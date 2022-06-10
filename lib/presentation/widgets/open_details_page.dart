import 'package:flutter/material.dart';
import 'package:movies/presentation/screens/details_page.dart';

void openDetailsPage(context, int? movieId) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailsPage(movieId!)),
  );
}
