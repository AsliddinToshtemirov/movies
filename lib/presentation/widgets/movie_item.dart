import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies/domain/services/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
          height: 500,
          fit: BoxFit.fill,
        ),
        elevation: 5,
        margin: const EdgeInsets.all(15),
      ),
      Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 160,
                            height: 70,
                            child: Text(
                              movie.title!,
                              style: const TextStyle(fontSize: 20),
                              maxLines: 4,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.star_border,
                                color: Colors.amber,
                              ),
                              Text(
                                movie.voteAverage.toString(),
                                style: const TextStyle(color: Colors.amber),
                              )
                            ],
                          ),
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
                )),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            height: 150,
            width: 308,
          )),
    ]);
  }
}
