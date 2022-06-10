import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../data/models/movie.dart';

class SmallItem extends StatelessWidget {
  final Movie movie;
  const SmallItem(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GlassContainer.clearGlass(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        height: 230,
        width: 300,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                height: 120,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(movie.title!),
                ),
                Row(
                  children: [
                    const Text("Language : "),
                    Text(movie.originalLanguage!),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 28),
              child: Icon(
                Icons.play_circle,
                size: 80,
                color: Color(0xFF733FF1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
