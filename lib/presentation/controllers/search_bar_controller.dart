import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yournonspotify/data/providers/providers_data.dart';
import 'package:yournonspotify/domain/models/item.dart';

part 'search_bar_controller.g.dart';

@Riverpod(keepAlive: true)
class SearchBarController extends _$SearchBarController {
  @override
  Future<List<Items>> build() async {
    return [];
  }

  Future<void> searchTrack({
    required String track,
    required List<String> types,
  }) async {
    state = const AsyncLoading();
    try {
      var accessToken = ref.read(authProvider)?.accesstoken;
      var result = await ref.read(spotifyRepository).searchTrack(
            accessToken: accessToken!,
            track: track,
            types: types,
          );
      state = AsyncData(result);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
