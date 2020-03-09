import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/favorite_bloc.dart';
import 'package:youtube_bloc/blocs/videos_bloc.dart';
import 'Api/api.dart';
import 'package:youtube_bloc/screens/home/home.dart';

void main() {
  Api api = Api();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideoBloc(),
      child: BlocProvider(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: Home(),
        ),
      ),
    );
  }
}
