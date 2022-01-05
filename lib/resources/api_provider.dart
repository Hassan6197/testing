import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:musically_app/models/albums.dart';




class ApiProvider {
  Client client = Client();
  final welcome = "";
  Future<Musically> fetchAlbumList(String albumName) async {
    String name = albumName;
    String apiKey ="1f1020d806aca0a51c816c28eafce5b5&" ;
    // final response = await client
    //     .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    final response = await client
        .get("http://ws.audioscrobbler.com/2.0/?method=album.search&album=$name&api_key=$apiKey&format=json");
    //print(response.body.toString());
    if (response.statusCode == 200) {
      return Musically.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}