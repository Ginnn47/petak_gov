import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/provider/items_model.dart';

class BookmarkBloc with ChangeNotifier {
  int _count = 0;
  List<ItemModel> items = [];

  StreamController<int> _countController = StreamController<int>();
  Stream<int> get countStream => _countController.stream;

  void addCount() {
    _count++;
    _countController.sink.add(_count);
    notifyListeners();
  }

  void addItems(ItemModel data) {
    items.add(data);
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index); // Hapus item berdasarkan indeks
      _count--; // Kurangi count
      notifyListeners();
    }
  }

  int get count => _count;

  List<ItemModel> get itemsList {
    return items;
  }

  void dispose() {
    _countController.close();
  }
}
