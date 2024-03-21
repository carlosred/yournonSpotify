import 'package:riverpod/riverpod.dart';
import 'package:yournonspotify/domain/models/item.dart';

final typesProvider = StateProvider<List<String>>((ref) => []);

final favoritesProvider = StateProvider<List<Items>>((ref) => []);
