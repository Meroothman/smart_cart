// ignore_for_file: avoid_function_literals_in_foreach_calls, unused_catch_clause, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import '../../../../../core/utils/functions.dart';
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
  bool orderSaved = false;

  CollectionReference orders = FirebaseFirestore.instance
      .collection('users')
      .doc(Constants.uId)
      .collection('orders');

  void startOrder(String cartId) {
    orderSaved = false;
    emit(OrderLoading());
    CollectionReference history = FirebaseFirestore.instance
        .collection('history')
        .doc(DateTime.now().toString().substring(0, 10))
        .collection("orders");

    history.add({
      'cartId': cartId,
      'uId': Constants.uId,
      'productsId': productsId,
      'totalPrice': 0,
      'date': DateTime.now().toString(),
    }).then((value) {
      history.doc(value.id).update({'orderId': value.id});

      history.doc(value.id).get().then((value) {
        orderModel = OrderModel.fromJson(value.data()!);
      });
      emit(OrderAdded());

      checkAddProduct();
    }).catchError((e) {
      emit(OrderError(
        error: e.toString(),
      ));
    });
  }

  void getProducts(String productId, String state) {
    emit(OrderReloading());

    FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .get()
        .then((value) {
      int count = 0;

      for (int i = 0; i < products.length; i++) {
        if (products[i].productId == productId) {
          count = products[i].userQuantity;
          break;
        }
      }

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
      calculateTotalPrice();

      emit(GetProductsSuccess(
          products: products, totalPrice: orderModel.totalPrice));
      if (products.isEmpty) {
        emit(NoProduct());
      }
    }).catchError((e) {
      emit(OrderError(
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
        products.clear();
        event.docs.forEach((element) {
          getProducts(element.data()['product_id'], element.data()['state']);
        });
      });
    } on Exception catch (e) {
      emit(OrderError(
        error: e.toString(),
      ));
    }
  }

  void finishOrder() {
    products.forEach((element) {
      productsId.add(
          {"productId": element.productId, "quantity": element.userQuantity});
    });
    orderModel.productsId = productsId;
    if (orderSaved) {
      orders.doc(orderModel.orderId).set(orderModel.toMap());
    }

    FirebaseFirestore.instance
        .collection("history")
        .doc(orderModel.date.substring(0, 10))
        .set({"date": orderModel.date.substring(0, 10)});

    CollectionReference history = FirebaseFirestore.instance
        .collection('history')
        .doc(DateTime.now().toString().substring(0, 10))
        .collection("orders");

    history.doc(orderModel.orderId).update({
      'productsId': productsId,
      'totalPrice': orderModel.totalPrice
    }).then((value) {
      emit(OrderFinished());
      clearData();
    }).catchError((e) {
      emit(OrderError(error: e.toString()));
    });
  }

  void cancelOrder() {
    CollectionReference history = FirebaseFirestore.instance
        .collection('history')
        .doc(DateTime.now().toString().substring(0, 10))
        .collection("orders");
    history.doc(orderModel.orderId).delete();

    clearData();

    emit(CancelOrderSuccess());
  }

  void calculateTotalPrice() {
    orderModel.totalPrice = 0;
    products.forEach((element) {
      orderModel.totalPrice += element.price * element.userQuantity;
    });
  }

  void clearData() {
    reduceQuantity();
    FirebaseFirestore.instance
        .collection('product_from_model')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.delete();
      });
    });
    products.clear();
    productsId.clear();
    listener.cancel();
  }

  void reduceQuantity() {
    for (var element in products) {
      FirebaseFirestore.instance
          .collection('Products')
          .doc(element.productId)
          .update({'quantity': element.quantity - element.userQuantity});
    }
  }

  void retryOrder(context) async {
    try {
      // Query the collection, ordering by the timestamp field in descending order and limit to 1
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("product_from_model")
          .orderBy('date', descending: true)
          .get();

      // Check if there is any document in the collection
      if (querySnapshot.docs.isNotEmpty) {
        // Get the document ID of the last added document
        String docId = querySnapshot.docs.first.id;

        // Delete the document
        await FirebaseFirestore.instance
            .collection("product_from_model")
            .doc(docId)
            .delete();
        checkAddProduct();
        Navigator.pop(context);
      } else {}
    } catch (e) {}
  }

  void saveOrder(context) {
    try {
      orderSaved = true;
      showToast(
          context, "Order Saved Successfully", ToastificationType.success);
    } on Exception catch (e) {
      showToast(context, "Order Not Saved !", ToastificationType.error);
    }
  }
}
