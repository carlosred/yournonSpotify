import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/presentation/controllers/search_bar_controller.dart';
import 'package:yournonspotify/presentation/providers/providers_presentation.dart';
import 'package:yournonspotify/presentation/widgets/floating_recommendations_button.dart';

import '../widgets/item_widget.dart';
import '../widgets/type_widget.dart';

class SearchBarPage extends ConsumerStatefulWidget {
  const SearchBarPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends ConsumerState<SearchBarPage> {
  final _searchBarhController = TextEditingController();

  final List<String> _types = ['track', 'album', 'artist'];

  Timer? _debounceTimer;

  void _onTypingFinished(String text) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (text.isNotEmpty) {
        var types = ref.read(typesProvider);
        ref.read(searchBarControllerProvider.notifier).searchTrack(
              track: _searchBarhController.text,
              types: types,
            );
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    var searchbarProvider = ref.watch(searchBarControllerProvider);
    var favorites = ref.watch(favoritesProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: favorites.isNotEmpty
            ? const FloatingRecomendationsButton()
            : const SizedBox(),
        extendBodyBehindAppBar: true,
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  width: width,
                  color: Colors.black54,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Flexible(
                        child: SizedBox(
                          height: height * 0.07,
                          child: Center(
                            child: TextFormField(
                              controller: _searchBarhController,
                              onChanged: (value) => _onTypingFinished(value),
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                                _onTypingFinished(_searchBarhController.text);
                              },
                              decoration: const InputDecoration.collapsed(
                                border: InputBorder.none,
                                fillColor: Colors.transparent,
                                hintText: 'what do you want to listen?',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i in _types)
                      TypeWidget(
                        value: i,
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Expanded(
                flex: 8,
                child: searchbarProvider.when(
                  data: (data) {
                    if (data.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) => ItemWidget(
                          index: index,
                          recommended: false,
                          item: data[index],
                          height: height,
                          width: width,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  error: (error, stack) => Center(
                    child: Text('Error:$error'),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                      strokeWidth: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
