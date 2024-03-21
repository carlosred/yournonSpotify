// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:yournonspotify/domain/models/item.dart';
import 'package:yournonspotify/presentation/providers/providers_presentation.dart';

import '../../utils/toast.dart';

class ItemWidget extends ConsumerStatefulWidget {
  const ItemWidget({
    super.key,
    required this.index,
    required this.recommended,
    required this.item,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final Items item;
  final bool recommended;
  final int index;

  @override
  ConsumerState<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends ConsumerState<ItemWidget>
    with AutomaticKeepAliveClientMixin {
  late String _imageUrl;
  late String _title;
  late String _subtitle;
  var _selected = false;

  @override
  bool get wantKeepAlive => true;

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

  void _onFavoriteSelectedTap() {
    setState(
      () {
        _selected = !_selected;

        if (_selected == true) {
          var favorites = ref.read(favoritesProvider);
          favorites.add(
            widget.item,
          );

          ref.read(favoritesProvider.notifier).state = [...favorites];
        } else {
          var favorites = ref.read(favoritesProvider);
          favorites.removeWhere((element) => element == widget.item);
          ref.read(favoritesProvider.notifier).state = [...favorites];
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var previewUrl = widget.item.previewUrl;
    var indexPlayer = ref.watch(indexPlayerProvider);
    var player = ref.watch(playProvider);

    super.build(context);
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
                      fontSize: 13.0,
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
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.recommended == false
                    ? GestureDetector(
                        onTap: _onFavoriteSelectedTap,
                        child: _selected
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.favorite_border_sharp,
                                color: Colors.white,
                              ),
                      )
                    : const SizedBox(),
                GestureDetector(
                  onTap: () {
                    if (previewUrl != null) {
                      player.play(
                        UrlSource(previewUrl),
                      );
                      Toast.showToast(
                        context: context,
                        message: 'Now Playing: ${widget.item.name}',
                      );
                      ref.read(indexPlayerProvider.notifier).state =
                          widget.index;
                    }
                  },
                  child: previewUrl != null
                      ? const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
