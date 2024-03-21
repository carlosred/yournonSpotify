import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yournonspotify/data/clients/spotify_client.dart';
import 'package:yournonspotify/data/clients/spotify_oath2_client.dart';
import 'package:yournonspotify/data/repositories/auth_repository.dart';
import 'package:yournonspotify/data/repositories/spotify_repository.dart';
import 'package:yournonspotify/domain/auth/spotify_auth.dart';

var spotifyAuthRepository = Provider<AuthRepository>(
  (ref) => AuthRepository(
    spotifyOauth2Client: SpotifyOauth2Client(),
  ),
);

var spotifyRepository = Provider<SpotifyRepository>(
  (ref) => SpotifyRepository(
    spotifyClient: SpotifyClient(),
  ),
);

var authProvider = StateProvider<SpotifyAuth?>((ref) => null);
