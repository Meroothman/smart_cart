// ignore_for_file: avoid_function_literals_in_foreach_calls

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
    FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .get()
        .then((value) {
      int count =
          products.where((element) => element.productId == productId).length;
      if (state == 'add') {
        if (count == 0) {
          products.add(ProductModel.fromJson(value.data()!, 1));
        } else {
          products
              .where((element) => element.productId == productId)
              .forEach((element) {
            element.userQuantity += 1;
          });
        }
      } else if (state == 'remove') {
        if (count == 1) {
          print("مالواد شاطر اهو");
          products.removeWhere((element) => element.productId == productId);
        } else if (count == 0) {
          print("فتح شويه ياموديل ياحبيبي");
        } else {
          print("يافرج الله ");

          products
              .where((element) => element.productId == productId)
              .forEach((element) {
            element.userQuantity -= 1;
          });
        }
      }
      products.forEach((element) {});
      emit(GetProductsSuccess());
    }).catchError((e) {
      emit(GetProductsError(
        error: e.toString(),
      ));
    });
  }

  void checkAddProduct() {
    FirebaseFirestore.instance
        .collection('product_from_model')
        .orderBy('date', descending: false)
        .snapshots()
        .listen((event) {
      emit(OrderLoading());
      products.clear();
      event.docs.forEach((element) {
        getProducts(element.data()['product_id'], element.data()['state']);
      });
      emit(AddProductSuccess());
    }).onError((e) {
      emit(AddProductError(
        error: e.toString(),
      ));
    });
  }

  void finishOrder() {
    products.forEach((element) {
      productsId.add(
          {"productId": element.productId, "quantity": element.userQuantity});
      orderModel.totalPrice += element.price * element.userQuantity;
    });
    orderModel.productsId = productsId;
    orders.doc(orderModel.orderId).update({
      'productsId': productsId,
      'totalPrice': orderModel.totalPrice
    }).then((value) {
      products.clear();
      productsId.clear();
      emit(OrderFinished());
    }).catchError((e) {
      emit(FinishOrderError(error: e.toString()));
    });
  }

  void cancelOrder() {
    if (products.isNotEmpty) {
      emit(CancelOrderError());
    } else {
      orders.doc(orderModel.orderId).delete();
      emit(CancelOrderSuccess());
    }
  }
}
