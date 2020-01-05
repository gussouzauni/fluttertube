import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/src/models/video.dart';
import 'package:fluttertube/src/screens/api.dart';

class VideoBloc extends BlocBase {
  Api api;
  List<Video> videos;

  //final because i don't to want acess out of my class
  final StreamController _videosController = StreamController();

  VideoBloc() {
    api = Api();
  }

  @override
  void dispose() {
    _videosController.close();
    super.dispose();
  }
}
