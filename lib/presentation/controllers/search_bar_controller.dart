import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yournonspotify/data/providers/providers_data.dart';
import 'package:yournonspotify/domain/models/track.dart';

part 'search_bar_controller.g.dart';

@Riverpod(keepAlive: true)
class SearchBarController extends _$SearchBarController {
  @override
  Future<List<Items>?> build() async {
    return null;
  }

  Future<void> searchTrack({
    required String track,
    List<String>? types,
  }) async {
    state = const AsyncLoading();
    try {
      var accessToken = ref.read(authProvider)?.accesstoken;
      var result = await ref.read(spotifyRepository).searchTrack(
            accessToken: accessToken!,
            track: track,
            types: types,
          );
      if (result != null) state = AsyncData(result.items);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
