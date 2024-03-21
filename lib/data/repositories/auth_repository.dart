import 'package:yournonspotify/data/clients/spotify_oath2_client.dart';
import 'package:yournonspotify/domain/auth/spotify_auth.dart';

class AuthRepository {
  final SpotifyOauth2Client spotifyOauth2Client;

  AuthRepository({required this.spotifyOauth2Client});

  Future<SpotifyAuth?> authenticate() async {
    SpotifyAuth? result;
    try {
      result = await spotifyOauth2Client.authenticate();
    } catch (e) {
      result = null;
    }
    return result;
  }
}
