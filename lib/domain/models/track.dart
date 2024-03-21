import 'externalUrls.dart';
import 'images.dart';
import 'item.dart';

class Tracks {
  Tracks({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    this.previous,
    required this.total,
  });
  late final String href;
  late final List<Items> items;
  late final int limit;
  late final String next;
  late final int offset;
  late final Null previous;
  late final int total;

  Tracks.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['limit'] = limit;
    _data['next'] = next;
    _data['offset'] = offset;
    _data['previous'] = previous;
    _data['total'] = total;
    return _data;
  }
}

class Album {
  Album({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });
  late final String albumType;
  late final List<Artist> artists;
  late final List<String> availableMarkets;
  late final ExternalUrls externalUrls;
  late final String href;
  late final String id;
  late final List<Images> images;
  late final String name;
  late final String releaseDate;
  late final String releaseDatePrecision;
  late final int totalTracks;
  late final String type;
  late final String uri;

  Album.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    artists =
        List.from(json['artists']).map((e) => Artist.fromJson(e)).toList();
    availableMarkets =
        List.castFrom<dynamic, String>(json['available_markets']);
    externalUrls = ExternalUrls.fromJson(json['external_urls']);
    href = json['href'];
    id = json['id'];
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['album_type'] = albumType;
    _data['artists'] = artists.map((e) => e.toJson()).toList();
    _data['available_markets'] = availableMarkets;
    _data['external_urls'] = externalUrls.toJson();
    _data['href'] = href;
    _data['id'] = id;
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['name'] = name;
    _data['release_date'] = releaseDate;
    _data['release_date_precision'] = releaseDatePrecision;
    _data['total_tracks'] = totalTracks;
    _data['type'] = type;
    _data['uri'] = uri;
    return _data;
  }
}

class Artist {
  Artist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });
  late final ExternalUrls externalUrls;
  late final String href;
  late final String id;
  late final String name;
  late final String type;
  late final String uri;

  Artist.fromJson(Map<String, dynamic> json) {
    externalUrls = ExternalUrls.fromJson(json['external_urls']);
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['external_urls'] = externalUrls.toJson();
    _data['href'] = href;
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['uri'] = uri;
    return _data;
  }
}

class ExternalIds {
  ExternalIds({
    required this.isrc,
  });
  late final String isrc;

  ExternalIds.fromJson(Map<String, dynamic> json) {
    isrc = json['isrc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isrc'] = isrc;
    return _data;
  }
}
