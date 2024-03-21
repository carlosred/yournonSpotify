// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyAuth _$SpotifyAuthFromJson(Map<String, dynamic> json) => SpotifyAuth(
      accesstoken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: json['expires_in'] as int,
    );

Map<String, dynamic> _$SpotifyAuthToJson(SpotifyAuth instance) =>
    <String, dynamic>{
      'access_token': instance.accesstoken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
    };
