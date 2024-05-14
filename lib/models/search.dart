import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Search extends ChangeNotifier {
  String id;
  String title;
  String image;
  String subtitle;
  bool _isFavorite;
  bool get isFavorite => _isFavorite;
  set isFavorite(bool value) {
    _isFavorite = value;
    notifyListeners();
  }

  Search({
    required this.id,
    required this.title,
    required this.image,
    required this.subtitle,
    required bool isFavorite, // Change this line
  }) : _isFavorite = isFavorite; // And this line

  // Factory method to create a Search from a Firestore document
  factory Search.fromDocument(DocumentSnapshot doc) {
    return Search(
      id: doc.id,
      title: doc['title'] ?? '',
      image: doc['image'] ?? '',
      subtitle: doc['subtitle'] ?? '',
      isFavorite: doc['isFavorite'] ?? false,
    );
  }

  static Stream<List<Search>> getSearches() {
    return FirebaseFirestore.instance
        .collection('searches')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Search.fromDocument(doc);
      }).toList();
    });
  }

  static Stream<List<Search>> getSearchesbyQuery(String query) {
    return FirebaseFirestore.instance
        .collection('searches')
        .where('title', isGreaterThanOrEqualTo: query)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Search.fromDocument(doc);
      }).toList();
    });
  }

  static Stream<List<Search>> getFavoriteSearches() {
    return FirebaseFirestore.instance
        .collection('searches')
        .where('isFavorite', isEqualTo: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Search.fromDocument(doc);
      }).toList();
    });
  }
}
