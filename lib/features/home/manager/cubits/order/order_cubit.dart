// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '/../core/utils/constants.dart';
import '/../features/home/data/order_model.dart';

import '../../../data/product_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];
  late OrderModel orderModel;
  List productsId = [];
  // ignore: prefer_typing_uninitialized_variables
  var listener;

  CollectionReference orders = FirebaseFirestore.instance
      .collection('users')
      .doc(Constants.uId)
      .collection('orders');

  void startOrder(String cartId) {
    emit(OrderLoading());

    orders.add({
      'cartId': cartId,
      'uId': Constants.uId,
      'productsId': productsId,
      'totalPrice': 0
    }).then((value) {
      orders.doc(value.id).update({'orderId': value.id});
      emit(OrderAdded());
      orders.doc(value.id).get().then((value) {
        orderModel = OrderModel.fromJson(value.data()!);
      });
      checkAddProduct();
    }).catchError((e) {
      emit(StartOrderError(
        error: e.toString(),
      ));
    });
  }

  void getProducts(String productId, String state) {
    print("products.length " + products.length.toString());
    emit(OrderReloading());
    FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .get()
        .then((value) {
      int count = 0;
      products.forEach((element) {
        if (element.productId == productId) {
          count = element.userQuantity;
        }
      });
      print("count $count");

      print("state $state");
      print("productId $productId");
      //  int count =
      //     products.where((element) => element.productId == productId).length;
      if (state == 'add') {
        if (count == 0) {
          products.add(ProductModel.fromJson(value.data()!, 1));
          emit(ProductIncreasedQuantity());
        } else {
          products
              .where((element) => element.productId == productId)
              .forEach((element) {
            element.userQuantity += 1;
          });
          emit(ProductIncreasedQuantity());
        }
      } else if (state == 'remove') {
        if (count == 1) {
          products.removeWhere((element) => element.productId == productId);
          emit(ProductDecreasedQuantity());
        } else if (count == 0) {
        } else {
          products
              .where((element) => element.productId == productId)
              .forEach((element) {
            element.userQuantity -= 1;
          });
          emit(ProductDecreasedQuantity());
        }
      }

      emit(GetProductsSuccess(
          products: products, totalPrice: orderModel.totalPrice));
      if (products.isEmpty) {
        emit(OrderLoading());
      }
    }).catchError((e) {
      print(e.toString());
      emit(GetProductsError(
        error: e.toString(),
      ));
    });
  }

  void checkAddProduct() {
    try {
      listener = FirebaseFirestore.instance
          .collection('product_from_model')
          .orderBy('date', descending: false)
          .snapshots()
          .listen((event) {
        print("event.docs.length  " + event.docs.length.toString());
        products.clear();
        event.docs.forEach((element) {
          getProducts(element.data()['product_id'], element.data()['state']);
        });
      });
    } on Exception catch (e) {
      emit(AddProductError(
        error: e.toString(),
      ));
    }
  }

  void finishOrder() {
    orderModel.productsId = productsId;
    products.forEach((element) {
      productsId.add(
          {"productId": element.productId, "quantity": element.userQuantity});
      orderModel.totalPrice += element.price * element.userQuantity;
    });
    orders.doc(orderModel.orderId).update({
      'productsId': productsId,
      'totalPrice': orderModel.totalPrice
    }).then((value) {
      products.clear();
      productsId.clear();

      FirebaseFirestore.instance
          .collection('product_from_model')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.delete();
        });
      });
      emit(OrderFinished());
    }).catchError((e) {
      emit(FinishOrderError(error: e.toString()));
    });
  }

  void cancelOrder() {
    if (products.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('product_from_model')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.delete();
        });
      });
      orders.doc(orderModel.orderId).delete();
      products.clear();
      productsId.clear();
      listener.cancel();

      emit(CancelOrderSuccess());
    } else {
      FirebaseFirestore.instance
          .collection('product_from_model')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.delete();
        });
      });
      orders.doc(orderModel.orderId).delete();
      products.clear();
      productsId.clear();
    }
  }

  void addHistory() {
    FirebaseFirestore.instance
        .collection("history")
        .doc(orderModel.orderId)
        .set(orderModel.toMap());
  }
}
