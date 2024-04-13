// ignore_for_file: non_constant_identifier_names

class ProductModel {
  final String description;
  final double price;
  final String productId;
  final String productName;
  final int quantity;
  final String url;

  ProductModel({
    required this.description,
    required this.price,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.url,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      description: json['description'],
      price: json['price'],
      productId: json['product_ID'],
      productName: json['product_name'],
      quantity: json['quantity'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'price': price,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'url': url,
    };
  }
}
