class ItemModel {
  String title;
  String subTitle;
  bool isFavorite;

  ItemModel(
      {required this.title,
      required this.subTitle,
      this.isFavorite = false,
      required image}); // Inisialisasi default dengan false
}
