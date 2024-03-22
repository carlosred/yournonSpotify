import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yournonspotify/utils/contants.dart';

class SpotifyClient {
  Future<Map<String, dynamic>?> searchTrack({
    required String accessToken,
    required String track,
    required List<String> types,
  }) async {
    Map<String, dynamic>? result;
    try {
      var url = Uri.https(Contants.baseApiUrl, Contants.searchUrl,
          {'q': track, 'type': (types.isNotEmpty ? types : 'track')});

      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        result = jsonDecode(response.body) as Map<String, dynamic>?;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed with status: ${e.toString()}');
    }
    return result;
  }

  Future<Map<String, dynamic>?> getRecomendations({
    required String accessToken,
    required List<String> seedArtist,
    required List<String> seedTracks,
  }) async {
    Map<String, dynamic>? result;
    try {
      var url = Uri.https(Contants.baseApiUrl, Contants.recommendatiosnUrl, {
        'seed_artists': seedArtist,
        'seed_tracks': seedTracks,
      });

      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $accessToken'
        },
      );

      if (response.statusCode == 200) {
        result = jsonDecode(response.body) as Map<String, dynamic>?;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed with status: ${e.toString()}');
    }
    return result;
  }
}
