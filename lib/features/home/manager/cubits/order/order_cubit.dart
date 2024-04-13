import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/product_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  List<ProductModel> products = [];

  void getProducts(String productId, String state) {
    var product = FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .get()
        .then((value) {
      print(value.data());
    });
  }

  void startShopping() {
    emit(OrderLoading());
  }

  void addProduct() {
    FirebaseFirestore.instance
        .collection('product_from_model')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        products.add(ProductModel.fromJson(element.data()));
        print(element.data());
      });
      emit(OrderAdded());
    });
  }

  void finishShopping() {}
}
