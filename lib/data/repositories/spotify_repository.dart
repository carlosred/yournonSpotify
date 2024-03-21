import 'package:yournonspotify/data/clients/spotify_client.dart';
import 'package:yournonspotify/domain/models/artist.dart';
import 'package:yournonspotify/domain/models/track.dart';

class SpotifyRepository {
  final SpotifyClient spotifyClient;

  SpotifyRepository({
    required this.spotifyClient,
  });

  Future<dynamic> searchTrack({
    required String accessToken,
    required String track,
    List<String>? types,
  }) async {
    dynamic result;
    try {
      result = await spotifyClient.searchTrack(
        accessToken: accessToken,
        track: track,
        types: types,
      );
      var key = result?.keys.first;
      switch (key) {
        case 'tracks':
          result = Track.fromJson(result![key]);
          break;

        case 'albums':
          result = Track.fromJson(result![key]);
          break;

        case 'artists':
          result = Artist.fromJson(result![key]);
          break;
        default:
          result = Track.fromJson(result![key]);
      }
    } catch (e) {
      result = null;
    }
    return result;
  }
}
