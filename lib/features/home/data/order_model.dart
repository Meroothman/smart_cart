class OrderModel {
  final String orderId;
  final String uId;
  final String cartId;
  final List productsId;

  OrderModel({
    required this.orderId,
    required this.uId,
    required this.cartId,
    required this.productsId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      uId: json['uId'],
      cartId: json['cartId'],
      productsId: json['productsId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'uId': uId,
      'cartId': cartId,
      'productsId': productsId,
    };
  }
}
