import 'package:flutter/material.dart';
import 'package:movie_app/remote/api.dart';
import 'package:movie_app/models/Movies.dart';
import 'package:movie_app/movie.dart';
import 'package:movie_app/remote/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  late Future<movies> _moviesFuture;

  @override
  void initState() {
    super.initState();
  }

  void _showMovieDetails(Results movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Movie(movie),
      ),
    );
  }

  Widget _buildMovieList(List<Results>? movies) {
    if (movies == null) {
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => _showMovieDetails(movies[index]),
          title: Text("${movies[index].title} (${movies[index].releaseDate})"),
          subtitle: Text("${movies[index].voteAverage}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<movies>(
                  future: _moviesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildMovieList(snapshot.data?.results);
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

