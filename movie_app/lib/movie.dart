import 'package:flutter/material.dart';
import 'package:movie_app/remote/constant.dart';
import 'package:movie_app/models/Movies.dart';

class Movie extends StatelessWidget {
  final Results movieInfo;

  const Movie(this.movieInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${movieInfo.title} (${movieInfo.releaseDate})"),
              Text("${movieInfo.voteAverage}"),
              Text("${movieInfo.overview}"),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
