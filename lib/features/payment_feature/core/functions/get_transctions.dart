import 'package:Auto_Shop/features/payment_feature/data/models/amout_model/amout_model.dart';
import 'package:Auto_Shop/features/payment_feature/data/models/amout_model/details.dart';
import 'package:Auto_Shop/features/payment_feature/data/models/item_list_model/item.dart';
import 'package:Auto_Shop/features/payment_feature/data/models/item_list_model/item_model.dart';

({AmoutModel amount, ItemListModel itemList}) getTransctionsData() {
  var amount = AmoutModel(
      total: "100",
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));

  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "4",
      quantity: 10,
    ),
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "5",
      quantity: 12,
    ),
  ];

  var itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}
