import 'package:musically_app/models/albums.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  final _repository = Repository();
  final _albumFetcher = PublishSubject<Musically>();

  Observable<Musically> get allAlbums => _albumFetcher.stream;

  fetchAllAlbums(String albumName) async {
    Musically musically = await _repository.fetchAllAlbums(albumName);
    _albumFetcher.sink.add(musically);
  }

  dispose() {
    _albumFetcher.close();
  }
}

final bloc = Bloc();