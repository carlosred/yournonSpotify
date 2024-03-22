import 'package:flutter/material.dart';
import 'package:yournonspotify/domain/models/item.dart';
import 'package:yournonspotify/presentation/pages/recomendations_page.dart';

import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/search_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case '/search':
        return MaterialPageRoute(
          builder: (context) => const SearchBarPage(),
        );

      case '/recommendations':
        var value = args as List<Items>;
        return MaterialPageRoute(
          builder: (context) => RecomendationsPage(
            recommendations: value,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }
}
