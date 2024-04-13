class OrderModel {
  final String orderId;
  final String uId;
  final String cartId;
  int totalPrice;
  List productsId;

  OrderModel({
    required this.orderId,
    required this.uId,
    required this.cartId,
    required this.productsId,
    required this.totalPrice,
  });

  factory OrderModel.fromJson(json) {
    return OrderModel(
      orderId: json['orderId'],
      uId: json['uId'],
      cartId: json['cartId'],
      productsId: json['productsId'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'uId': uId,
      'cartId': cartId,
      'productsId': productsId,
      'totalPrice': totalPrice,
    };
  }
}
