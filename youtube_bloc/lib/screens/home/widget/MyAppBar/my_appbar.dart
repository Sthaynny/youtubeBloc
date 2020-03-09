import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/favorite_bloc.dart';
import 'package:youtube_bloc/blocs/videos_bloc.dart';
import 'package:youtube_bloc/delegates/data_search.dart';
import 'package:youtube_bloc/models/video.dart';
import 'package:youtube_bloc/screens/favorites/favorites.dart';

Widget MyAppBar(BuildContext context) {
  final vbloc = BlocProvider.of<VideoBloc>(context);
  final favBloc = BlocProvider.of<FavoriteBloc>(context);
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.black87,
    title: Container(
      height: 25,
      child: Image.asset("images/yt_logo_rgb_dark.png"),
    ),
    actions: <Widget>[
      Align(
        alignment: Alignment.center,
        child: StreamBuilder<Map<String, Video>>(
            stream: favBloc.outFav,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(
                  "${snapshot.data.length}",
                  style: TextStyle(fontSize: 16),
                );
              else {
                return Container();
              }
            }),
      ),
      IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Favorites()));
          }),
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            String result =
                await showSearch(context: context, delegate: DataSearch());
            if (result != null) {
              vbloc.intSeach.add(result);
            }
          }),
    ],
  );
}
