import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/src/models/video.dart';
import 'package:fluttertube/src/screens/api.dart';

class VideosBloc extends BlocBase {
  Api api;
  List<Video> videos;

  VideosBloc() {
    api = Api();

    //get date and to send
    _searchController.stream.listen(_search);
  }

  //final because i don't to want acess out of my class
  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  //return _videos.stream
  Stream get outVideos => _videosController.stream;

  //insert into bloc
  final StreamController<String> _searchController = StreamController<String>();
  //add in _searchController
  Sink get inSearch => _searchController.sink;

  void _search(String search) async {
    //return date api
    videos = await api.search(search);
    //to send date api for videoscontroller
    _videosController.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
  }
}
