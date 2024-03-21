import 'package:yournonspotify/domain/models/item.dart';

import 'externalUrls.dart';

class Albums {
  Albums({
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

  Albums.fromJson(Map<String, dynamic> json) {
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
