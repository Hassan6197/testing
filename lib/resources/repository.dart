import 'dart:async';
import 'package:musically_app/models/albums.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<Musically> fetchAllAlbums(String albumName) => apiProvider.fetchAlbumList(albumName);
}