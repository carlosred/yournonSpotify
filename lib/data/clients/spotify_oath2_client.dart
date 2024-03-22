import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:yournonspotify/domain/auth/spotify_auth.dart';
import 'package:yournonspotify/utils/contants.dart';

class SpotifyOauth2Client {
  static const identifier = '2681df7762ea4000a25f9bcc5620b8ec';
  static const clientSecret = '3e45b121a2ed407cade501a7c2123f08';
  static const redirectUri = 'yournonspotify';
  Future<SpotifyAuth?> authenticate() async {
    var url = Uri.https(Contants.baseOauth2Url, Contants.authorizeUrl, {
      'response_type': 'code',
      'client_id': identifier,
      'client_secret': clientSecret,
      'redirect_uri': '$redirectUri:/',
      'scope': 'user-read-private user-read-email',
      // 'code_challenge': codeChallenge,
      //'code_challenge_method': 'S256',
    });
    final response = await FlutterWebAuth2.authenticate(
      url: url.toString(),
      callbackUrlScheme: redirectUri.toString(),
    );
    final result = Uri.parse(response).queryParameters['code'];

    var jsonAuth = await getAccessToken(
      authorizationCode: result,
    );

    var auth = SpotifyAuth.fromJson(jsonAuth);

    return auth;
  }

  Future<dynamic> getAccessToken({
    required String? authorizationCode,
  }) async {
    try {
      var url = Uri.https('accounts.spotify.com', '/api/token', {
        'grant_type': 'authorization_code',
        'code': authorizationCode,
        'client_id': identifier,
        'redirect_uri': '$redirectUri:/',
      });

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Basic ${generateBase64Credentials(identifier, clientSecret)}'
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Request failed with status: ${e.toString()}');
    }
  }

  String generateBase64Credentials(String clientId, String clientSecret) {
    String credentials = '$clientId:$clientSecret';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedCredentials = stringToBase64.encode(credentials);
    return encodedCredentials;
  }
}
