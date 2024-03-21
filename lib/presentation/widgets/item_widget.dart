import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yournonspotify/domain/models/item.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    required this.item,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final Items item;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late String _imageUrl;
  late String _title;
  late String _subtitle;

  @override
  void initState() {
    _checkType(widget.item.type);
    super.initState();
  }

  void _checkType(String type) {
    switch (type) {
      case 'artist':
        _imageUrl = widget.item.images!.first.url;
        _title = widget.item.name;
        _subtitle = widget.item.type;
        break;
      case 'album':
        _imageUrl = widget.item.images!.first.url;
        _title = widget.item.name;
        _subtitle =
            '${widget.item.artists!.first.name} - ${widget.item.releaseDate?.split('-')[0]}';
        break;
      case 'track':
        _imageUrl = widget.item.album!.images.first.url;
        _title = widget.item.name;
        _subtitle = '${widget.item.type} - ${widget.item.artists?.first.name}';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 60 / 10,
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              imageUrl: _imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  _subtitle,
                  style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
