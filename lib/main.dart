import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/src/blocs/favorite_bloc.dart';
import 'package:fluttertube/src/blocs/videos_bloc.dart';
import 'package:fluttertube/src/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: VideosBloc(),
        child: BlocProvider(
          bloc: FavoriteBloc(),
          child: MaterialApp(
              title: 'App com Bloc e API',
              debugShowCheckedModeBanner: false,
              home: Home()),
        ));
  }
}
