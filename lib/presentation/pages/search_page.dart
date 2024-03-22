import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/presentation/controllers/login_controller.dart';
import 'package:yournonspotify/presentation/controllers/search_bar_controller.dart';
import 'package:yournonspotify/presentation/providers/providers_presentation.dart';
import 'package:yournonspotify/presentation/widgets/floating_recommendations_button.dart';
import 'package:yournonspotify/presentation/widgets/search_bar.dart';
import 'package:yournonspotify/utils/enum.dart';
import 'package:yournonspotify/utils/styles.dart';

import '../widgets/items_list.dart';
import '../widgets/loader.dart';
import '../widgets/type_widget.dart';

class SearchBarPage extends ConsumerStatefulWidget {
  const SearchBarPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends ConsumerState<SearchBarPage> {
  final _searchBarhController = TextEditingController();

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
            color: Styles.appColor,
          ),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  width: width,
                  color: Styles.appBarColor,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          ref.read(loginControllerProvider.notifier).logout();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      SearchSpotifyBar(
                        searchBarController: _searchBarhController,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i in Types.values)
                      TypeWidget(
                        value: i.name,
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
                      return ItemsListWidget(
                        items: data,
                        height: height,
                        width: width,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  error: (error, stack) => Center(
                    child: Text(
                      'Error:${error.toString()}',
                    ),
                  ),
                  loading: () => const Loader(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
