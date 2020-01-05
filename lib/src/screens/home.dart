import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/src/blocs/videosBloc.dart';
import 'package:fluttertube/src/delegates/data_search.dart';
import 'package:fluttertube/src/widgets/video_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: Image.asset("assets/youtube.jpg"),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async {
              //call the searchDelegate
              //get text
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null)
                BlocProvider.of<VideosBloc>(context).inSearch.add(result);
            },
          ),
        ],
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
              itemBuilder: (context, index) {
                return VideoTile(snapshot.data[index]);
              },
              itemCount: snapshot.data.length,
            );
          else
            return Container();
        },
      ),
    );
  }
}
