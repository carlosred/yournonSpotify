import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/contants.dart';
import '../../utils/styles.dart';
import '../controllers/search_bar_controller.dart';
import '../providers/providers_presentation.dart';

class SearchSpotifyBar extends ConsumerStatefulWidget {
  SearchSpotifyBar({required this.searchBarController, super.key});

  final TextEditingController searchBarController;
  @override
  ConsumerState<SearchSpotifyBar> createState() => _SearchSpotifyBarState();
}

class _SearchSpotifyBarState extends ConsumerState<SearchSpotifyBar> {
  Timer? _debounceTimer;

  void _onTypingFinished(String text) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (text.isNotEmpty) {
        var types = ref.read(typesProvider);
        ref.read(searchBarControllerProvider.notifier).searchTrack(
              track: widget.searchBarController.text,
              types: types,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Flexible(
      child: SizedBox(
        height: height * 0.07,
        child: Center(
          child: TextFormField(
            controller: widget.searchBarController,
            onChanged: (value) => _onTypingFinished(value),
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
              _onTypingFinished(widget.searchBarController.text);
            },
            decoration: const InputDecoration.collapsed(
              border: InputBorder.none,
              fillColor: Colors.transparent,
              hintText: Contants.searchMessage,
              hintStyle: Styles.hintTextStyle,
            ),
            style: Styles.tittleAppBarTextStyle,
          ),
        ),
      ),
    );
  }
}
