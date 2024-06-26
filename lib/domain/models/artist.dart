import 'package:yournonspotify/domain/models/item.dart';

class Artists {
  Artists({
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

  Artists.fromJson(Map<String, dynamic> json) {
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
