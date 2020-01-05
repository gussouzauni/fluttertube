import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/src/blocs/videosBloc.dart';
import 'package:fluttertube/src/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: MaterialApp(
          title: 'App com bloc e API',
          debugShowCheckedModeBanner: false,
          home: Home()),
    );
  }
}
