class ProductModel {
  String id;
  String image;
  String name;
  String description;
  double price;
  String type;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.isFavorite,
    required this.type,
  });
}
