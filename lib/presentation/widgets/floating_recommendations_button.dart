import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/core/routes/routes.dart';
import 'package:yournonspotify/data/providers/providers_data.dart';
import 'package:yournonspotify/presentation/providers/providers_presentation.dart';
import 'package:yournonspotify/utils/toast.dart';

import 'loader.dart';

class FloatingRecomendationsButton extends ConsumerStatefulWidget {
  const FloatingRecomendationsButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FloatingRecomendationsButtonState();
  }
}

class _FloatingRecomendationsButtonState
    extends ConsumerState<FloatingRecomendationsButton> {
  var _loading = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    return FloatingActionButton.extended(
      label: Text(
        _loading ? 'Searching recommendations' : 'Get Recommendations',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      onPressed: () async {
        var accessToken = ref.read(authProvider)!.accesstoken;
        var seeds = ref.read(favoritesProvider);

        if (seeds.isNotEmpty) {
          setState(() {
            _loading = true;
          });
          var trackRecommended =
              await ref.read(spotifyRepository).getRecomendations(
                    accessToken: accessToken,
                    seeds: seeds,
                  );
          if (trackRecommended.isNotEmpty) {
            setState(() {
              _loading = false;
            });

            Navigator.pushNamed(
              // ignore: use_build_context_synchronously
              context,
              Routes.recommendationsRoute,
              arguments: trackRecommended,
            );
          }
        } else {
          Toast.showToast(
            context: context,
            message: 'The list of favorites is empty, at least pick one',
          );
        }
      },
      tooltip: _loading ? 'Searching recommendations' : 'Get Recommendations',
      icon: _loading
          ? const Loader()
          : const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
      backgroundColor: Colors.black87,
      extendedTextStyle: const TextStyle(color: Colors.white),
      isExtended: true,
    );
  }
}
