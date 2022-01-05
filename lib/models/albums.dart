import 'dart:convert';

Musically musicallyFromJson(String str) => Musically.fromJson(json.decode(str));

String musicallyToJson(Musically data) => json.encode(data.toJson());

class Musically {
  Musically({
    this.results,
  });

  Results results;

  factory Musically.fromJson(Map<String, dynamic> json) => Musically(
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results.toJson(),
  };
}

class Results {
  Results({
    this.opensearchQuery,
    this.opensearchTotalResults,
    this.opensearchStartIndex,
    this.opensearchItemsPerPage,
    this.albummatches,
    this.attr,
  });

  OpensearchQuery opensearchQuery;
  String opensearchTotalResults;
  String opensearchStartIndex;
  String opensearchItemsPerPage;
  Albummatches albummatches;
  Attr attr;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    opensearchQuery: OpensearchQuery.fromJson(json["opensearch:Query"]),
    opensearchTotalResults: json["opensearch:totalResults"],
    opensearchStartIndex: json["opensearch:startIndex"],
    opensearchItemsPerPage: json["opensearch:itemsPerPage"],
    albummatches: Albummatches.fromJson(json["albummatches"]),
    attr: Attr.fromJson(json["@attr"]),
  );

  Map<String, dynamic> toJson() => {
    "opensearch:Query": opensearchQuery.toJson(),
    "opensearch:totalResults": opensearchTotalResults,
    "opensearch:startIndex": opensearchStartIndex,
    "opensearch:itemsPerPage": opensearchItemsPerPage,
    "albummatches": albummatches.toJson(),
    "@attr": attr.toJson(),
  };
}

class Albummatches {
  Albummatches({
    this.album,
  });

  List<Album> album;

  factory Albummatches.fromJson(Map<String, dynamic> json) => Albummatches(
    album: List<Album>.from(json["album"].map((x) => Album.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "album": List<dynamic>.from(album.map((x) => x.toJson())),
  };
}

class Album {
  Album({
    this.name,
    this.artist,
    this.url,
    this.image,
    this.streamable,
    this.mbid,
  });

  String name;
  String artist;
  String url;
  List<AlbumImage> image;
  String streamable;
  String mbid;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    name: json["name"],
    artist: json["artist"],
    url: json["url"],
    image: List<AlbumImage>.from(json["image"].map((x) => AlbumImage.fromJson(x))),
    streamable: json["streamable"],
    mbid: json["mbid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "artist": artist,
    "url": url,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "streamable": streamable,
    "mbid": mbid,
  };
}

class AlbumImage {
  AlbumImage({
    this.text,
    // this.size,
  });

  String text;
  // Size size;

  factory AlbumImage.fromJson(Map<String, dynamic> json) => AlbumImage(
    text: json["#text"],
    // size: sizeValues.map[json["size"]],
  );

  Map<String, dynamic> toJson() => {
    "#text": text,
    // "size": sizeValues.reverse[size],
  };
}

enum Size { SMALL, MEDIUM, LARGE, EXTRALARGE }

final sizeValues = EnumValues({
  "extralarge": Size.EXTRALARGE,
  "large": Size.LARGE,
  "medium": Size.MEDIUM,
  "small": Size.SMALL
});

class Attr {
  Attr({
    this.attrFor,
  });

  String attrFor;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
    attrFor: json["for"],
  );

  Map<String, dynamic> toJson() => {
    "for": attrFor,
  };
}

class OpensearchQuery {
  OpensearchQuery({
    this.text,
    this.role,
    this.searchTerms,
    this.startPage,
  });

  String text;
  String role;
  String searchTerms;
  String startPage;

  factory OpensearchQuery.fromJson(Map<String, dynamic> json) => OpensearchQuery(
    text: json["#text"],
    role: json["role"],
    searchTerms: json["searchTerms"],
    startPage: json["startPage"],
  );

  Map<String, dynamic> toJson() => {
    "#text": text,
    "role": role,
    "searchTerms": searchTerms,
    "startPage": startPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
