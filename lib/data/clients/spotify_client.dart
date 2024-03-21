import 'dart:convert';

import 'package:yournonspotify/data/clients/base_client.dart';
import 'package:http/http.dart' as http;

class SpotifyClient extends BaseClient {
  Future<Map<String, dynamic>?> searchTrack({
    required String accessToken,
    required String track,
    required List<String> types,
  }) async {
    Map<String, dynamic>? result;
    try {
      var url = Uri.https('api.spotify.com', '/v1/search',
          {'q': track, 'type': (types.isNotEmpty ? types : 'track')});

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
