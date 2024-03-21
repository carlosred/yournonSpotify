import 'package:yournonspotify/domain/models/artist.dart';
import 'package:yournonspotify/domain/models/track.dart';

import 'externalUrls.dart';
import 'images.dart';

class Items {
  Items({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.followers,
    this.genres,
    this.images,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.albumType,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
  });

  late final ExternalUrls externalUrls;
  late final String href;
  late final String id;
  late final String name;
  late final String type;
  late final String uri;
  final Album? album;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final ExternalIds? externalIds;
  final Followers? followers;
  final List<String>? genres;
  final List<Images>? images;
  final int? popularity;
  final String? previewUrl;
  final int? trackNumber;
  final String? albumType;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;

  Items.fromJson(Map<String, dynamic> json)
      : externalUrls = ExternalUrls.fromJson(json['external_urls']),
        href = json['href'],
        id = json['id'],
        name = json['name'],
        type = json['type'],
        uri = json['uri'],
        album = json['album'] != null ? Album.fromJson(json['album']) : null,
        artists = json['artists'] != null
            ? List.from(json['artists']).map((e) => Artist.fromJson(e)).toList()
            : null,
        availableMarkets = json['available_markets'] != null
            ? List.castFrom<dynamic, String>(json['available_markets'])
            : null,
        discNumber = json['disc_number'],
        durationMs = json['duration_ms'],
        explicit = json['explicit'],
        externalIds = json['external_ids'] != null
            ? ExternalIds.fromJson(json['external_ids'])
            : null,
        followers = json['followers'] != null
            ? Followers.fromJson(json['followers'])
            : null,
        genres = json['genres'] != null
            ? List.castFrom<dynamic, String>(json['genres'])
            : null,
        images = json['images'] != null
            ? List.from(json['images']).map((e) => Images.fromJson(e)).toList()
            : null,
        popularity = json['popularity'],
        previewUrl = json['preview_url'],
        trackNumber = json['track_number'],
        albumType = json['album_type'],
        releaseDate = json['release_date'],
        releaseDatePrecision = json['release_date_precision'],
        totalTracks = json['total_tracks'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['external_urls'] = externalUrls.toJson();
    _data['href'] = href;
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['uri'] = uri;
    if (album != null) _data['album'] = album!.toJson();
    if (artists != null)
      _data['artists'] = artists!.map((e) => e.toJson()).toList();
    if (availableMarkets != null)
      _data['available_markets'] = availableMarkets!;
    if (discNumber != null) _data['disc_number'] = discNumber!;
    if (durationMs != null) _data['duration_ms'] = durationMs!;
    if (explicit != null) _data['explicit'] = explicit!;
    if (externalIds != null) _data['external_ids'] = externalIds!.toJson();
    if (followers != null) _data['followers'] = followers!.toJson();
    if (genres != null) _data['genres'] = genres!;
    if (images != null)
      _data['images'] = images!.map((e) => e.toJson()).toList();
    if (popularity != null) _data['popularity'] = popularity!;
    if (previewUrl != null) _data['preview_url'] = previewUrl!;
    if (trackNumber != null) _data['track_number'] = trackNumber!;
    if (albumType != null) _data['album_type'] = albumType!;
    if (releaseDate != null) _data['release_date'] = releaseDate!;
    if (releaseDatePrecision != null)
      _data['release_date_precision'] = releaseDatePrecision!;
    if (totalTracks != null) _data['total_tracks'] = totalTracks!;
    return _data;
  }
}
