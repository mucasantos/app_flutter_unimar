// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  //Converter o JSON para uma intancia do meu Produto que vem da API

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image']);
  }
}
