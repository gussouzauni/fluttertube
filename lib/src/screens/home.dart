import 'package:flutter/material.dart';
import 'package:fluttertube/src/delegates/data_search.dart';

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
            onPressed: () {
              //Chamar o searchDelegate
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
