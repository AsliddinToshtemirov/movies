import 'package:flutter/material.dart';
import 'package:movies/core/utils/constants.dart';
import 'package:movies/data/models/viewmodel/details_viewmodel.dart';
import 'package:movies/data/models/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainViewModel()),
    ChangeNotifierProvider(create: (_) => DetailsViewModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      title: myAppName,
      home: const MyHomePage(),
    );
  }
}
