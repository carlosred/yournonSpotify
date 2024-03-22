import 'package:flutter/material.dart';

class Contants {
//urls
  static const baseApiUrl = 'api.spotify.com';
  static const baseOauth2Url = 'accounts.spotify.com';
  static const recommendatiosnUrl = '/v1/recommendations';
  static const searchUrl = '/v1/search';
  static const authorizeUrl = '/authorize';

  //messages
  static const welcomeMessage = 'Welcome To YourNonSpotify App';
  static const errorMessage = 'Request failed with status';
  static const recommendationsMessage = 'Recommended songs';
  static const searchMessage = 'What do you want to listen?';

  // assets
  static const loginImageAsset = 'assets/login_background.jpg';

  //styles

  static const tittleAppBar = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}
