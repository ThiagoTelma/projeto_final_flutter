import 'models.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // A DummyJSON retorna 'rating' como double diretamente no objeto do produto.
    // E 'stock' como int, que podemos usar para 'count'.
    final double rate = (json['rating'] as num).toDouble();
    final int count =
        (json['stock'] as num).toInt(); // Usando 'stock' como 'count'

    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['thumbnail'], // Continua pegando do 'thumbnail'
        rating: RatingModel(
            rate: rate, count: count)); // Constrói RatingModel diretamente
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson()
    };
  }
}
