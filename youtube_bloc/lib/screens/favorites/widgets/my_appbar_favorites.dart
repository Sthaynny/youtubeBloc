import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/favorite_bloc.dart';

Widget myAppBarFavorit(context){
  final favBloc = BlocProvider.of<FavoriteBloc>(context);
  return AppBar(
    title: Text("Favoritos"),
    centerTitle: true,
    backgroundColor: Colors.black87,

  );
}