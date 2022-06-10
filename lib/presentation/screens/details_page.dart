import 'package:flutter/material.dart';
import 'package:movies/core/api/api_response.dart';
import 'package:movies/data/models/viewmodel/details_viewmodel.dart';
import 'package:movies/presentation/widgets/initUi.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final int movieId;

  const DetailsPage(
    this.movieId, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<DetailsViewModel>(context, listen: false)
        .fetchDetailsById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("salom"),
      ),
      body: Consumer<DetailsViewModel>(
        builder: (context, data, child) {
          if (data.response.status == Status.Loading) {
            return const CircularProgressIndicator();
          }

          if (data.response.status == Status.Error) {
            return Center(
                child: Text(
              data.response.message!,
              style: const TextStyle(fontSize: 24, color: Colors.black26),
            ));
          }
          if (data.response.status == Status.Initial) {
            return initUi(data.details!);
          }

          if (data.response.status == Status.Complated) {}
          return Container(
            color: Colors.black,
            height: 30,
            width: 45,
          );
        },
      ),
    );
  }
}
