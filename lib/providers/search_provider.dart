import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<Map<String, String>> {
  SearchNotifier() : super({});

  void setIsFavorite(String id, bool isFavorite) {
    state = {
      'id': id,
      'isFavorite': isFavorite.toString(),
    };
  }
}

final searchProvider =
    StateNotifierProvider<SearchNotifier, Map<String, String>>((ref) {
  return SearchNotifier();
});
