class OrderModel {
  final String orderId;
  final String uId;
  final String cartId;
  final String date;
  int totalPrice;
  List productsId;

  OrderModel({
    required this.orderId,
    required this.uId,
    required this.cartId,
    required this.productsId,
    required this.totalPrice,
    required this.date,
  });

  factory OrderModel.fromJson(json) {
    return OrderModel(
      orderId: json['orderId'],
      uId: json['uId'],
      cartId: json['cartId'],
      productsId: json['productsId'],
      totalPrice: json['totalPrice'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'uId': uId,
      'cartId': cartId,
      'productsId': productsId,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}
