import 'package:flutter/material.dart';
import 'package:movies/core/api/api_response.dart';
import 'package:movies/data/models/viewmodel/viewmodel.dart';
import 'package:movies/presentation/widgets/custom_appbar.dart';
import 'package:movies/presentation/widgets/custom_bottomNavbar.dart';
import 'package:movies/presentation/widgets/movie_item.dart';
import 'package:provider/provider.dart';

import '../widgets/small_movie_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<MainViewModel>(context, listen: false).fetchPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121225),
      appBar: AppBar(
        backgroundColor: const Color(0xff121225),
        elevation: 0,
        actions: const [AppbarCustom()],
      ),
      body: Consumer<MainViewModel>(builder: (context, data, child) {
        if (data.response.status == Status.Loading) {
          return const CircularProgressIndicator();
        }

        if (data.response.status == Status.Error) {
          return Center(
              child: Text(
            data.response.message!,
            style: const TextStyle(fontSize: 24),
          ));
        }
        if (data.response.status == Status.Initial) {
          return const Text("Initial");
        }
        return Column(
          children: [
            const Text(
              "Explore new realised movies",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieItem(
                      data.movies[index],
                    );
                  }),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SmallItem(
                      data.movies[index],
                    );
                  }),
            )
          ],
        );
      }),
      bottomNavigationBar: const BottomNa(),
    );
  }
}
