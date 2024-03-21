class Artist {
  Artist({
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

  Artist.fromJson(Map<String, dynamic> json) {
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

class Items {
  Items({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });
  late final ExternalUrls externalUrls;
  late final Followers followers;
  late final List<String> genres;
  late final String href;
  late final String id;
  late final List<Images> images;
  late final String name;
  late final int popularity;
  late final String type;
  late final String uri;

  Items.fromJson(Map<String, dynamic> json) {
    externalUrls = ExternalUrls.fromJson(json['external_urls']);
    followers = Followers.fromJson(json['followers']);
    genres = List.castFrom<dynamic, String>(json['genres']);
    href = json['href'];
    id = json['id'];
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    name = json['name'];
    popularity = json['popularity'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['external_urls'] = externalUrls.toJson();
    _data['followers'] = followers.toJson();
    _data['genres'] = genres;
    _data['href'] = href;
    _data['id'] = id;
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['name'] = name;
    _data['popularity'] = popularity;
    _data['type'] = type;
    _data['uri'] = uri;
    return _data;
  }
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });
  late final String spotify;

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['spotify'] = spotify;
    return _data;
  }
}

class Followers {
  Followers({
    this.href,
    required this.total,
  });
  late final Null href;
  late final int total;

  Followers.fromJson(Map<String, dynamic> json) {
    href = null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    _data['total'] = total;
    return _data;
  }
}

class Images {
  Images({
    required this.height,
    required this.url,
    required this.width,
  });
  late final int height;
  late final String url;
  late final int width;

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['height'] = height;
    _data['url'] = url;
    _data['width'] = width;
    return _data;
  }
}
