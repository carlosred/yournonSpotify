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
