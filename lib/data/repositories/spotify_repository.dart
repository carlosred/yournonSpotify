import 'package:yournonspotify/data/clients/spotify_client.dart';
import 'package:yournonspotify/domain/models/album.dart';
import 'package:yournonspotify/domain/models/artist.dart';
import 'package:yournonspotify/domain/models/item.dart';
import 'package:yournonspotify/domain/models/track.dart';

class SpotifyRepository {
  final SpotifyClient spotifyClient;

  SpotifyRepository({
    required this.spotifyClient,
  });

  Future<List<Items>> searchTrack({
    required String accessToken,
    required String track,
    required List<String> types,
  }) async {
    List<Items> result;
    try {
      var response = await spotifyClient.searchTrack(
        accessToken: accessToken,
        track: track,
        types: types,
      );
      var key = response?.keys.first;
      switch (key) {
        case 'tracks':
          result = Tracks.fromJson(response![key]).items;
          break;

        case 'albums':
          result = Albums.fromJson(response![key]).items;
          break;

        case 'artists':
          result = Artists.fromJson(response![key]).items;
          break;
        default:
          result = Tracks.fromJson(response![key]).items;
      }
    } catch (e) {
      result = [];
    }
    return result;
  }

  Future<List<Items>> getRecomendations({
    required String accessToken,
    required List<Items> seeds,
  }) async {
    List<Items> result;
    try {
      var seedArtists = seeds.map((e) => e.artists!.first.id).toList();
      var seedTracks = seeds.map((e) => e.id).toList();

      var response = await spotifyClient.getRecomendations(
        accessToken: accessToken,
        seedArtist: seedArtists,
        seedTracks: seedTracks,
      );
      result =
          List.from(response!['tracks']).map((e) => Items.fromJson(e)).toList();
    } catch (e) {
      result = [];
    }
    return result;
  }
}
