import 'dart:convert';

import 'package:fluttertube/src/models/video.dart';
//importo como http para chamar antes dos métodos e deixar mais legível o código
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyBMzV1U7QdDj5gu_dH-pCVzIP9kiu3j0Lg";

class Api {
  search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    decode(response);
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      } //function anonima
          ).toList(); //transforma em uma lista de videos
      return videos;
    }
  }
}
