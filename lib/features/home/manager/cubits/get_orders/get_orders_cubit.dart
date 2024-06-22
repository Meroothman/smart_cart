import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/order_model.dart';
part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());

  static GetOrdersCubit get(context) => BlocProvider.of(context);

  List<OrderModel> userOrders = [];

  void getOrders() async {
    emit(GetOrdersLoading());
    userOrders.clear();
    await ordersLoop();
  }

  Future<void> ordersLoop() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Constants.uId)
        .collection("orders")
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        emit(NoOrders());
      }
      for (var element in value.docs) {
        getOrderDetails(element.data()["orderId"]);
      }
    }).catchError((e) {});
  }

  void getOrderDetails(String orderId) async {
    List productsData = [];
    emit(GetOrderDetailsLoading());
    FirebaseFirestore.instance
        .collection("users")
        .doc(Constants.uId)
        .collection("orders")
        .doc(orderId)
        .get()
        .then((value) async {
      OrderModel order = OrderModel.fromJson(value.data()!);

      for (int i = 0; i < order.productsId.length; i++) {
        await FirebaseFirestore.instance
            .collection("Products")
            .doc(order.productsId[i]['productId'])
            .get()
            .then((value) {
          productsData.add({
            'name': value.data()!['product_name'],
            'price': value.data()!['price'],
            'quantity': order.productsId[i]['quantity'],
          });
        }).catchError((e) {});
      }

      order.productsId = productsData;

      userOrders.add(order);
      emit(GetOrdersSuccess(
        userOrders,
      ));
    }).catchError((e) {});
  }

  void deleteOrder(String orderId) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Constants.uId)
        .collection("orders")
        .doc(orderId)
        .delete()
        .then((value) => getOrders())
        .catchError(onError);
  }
}
