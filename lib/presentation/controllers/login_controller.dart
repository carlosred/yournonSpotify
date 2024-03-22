import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yournonspotify/data/providers/providers_data.dart';
import 'package:yournonspotify/domain/auth/spotify_auth.dart';

part 'login_controller.g.dart';

@Riverpod(keepAlive: true)
class LoginController extends _$LoginController {
  @override
  Future<SpotifyAuth?> build() async {
    return null;
  }

  Future<void> authenticate() async {
    state = const AsyncLoading();
    try {
      var auth = await ref.read(spotifyAuthRepository).authenticate();

      state = AsyncData(auth);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }

  void logout() {
    state = const AsyncData(null);
  }
}
