import 'package:json_annotation/json_annotation.dart';

part 'spotify_auth.g.dart';

@JsonSerializable()
class SpotifyAuth {
  @JsonKey(name: 'access_token')
  final String accesstoken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expires_in')
  final int expiresIn;

  SpotifyAuth({
    required this.accesstoken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory SpotifyAuth.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAuthFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyAuthToJson(this);
}
