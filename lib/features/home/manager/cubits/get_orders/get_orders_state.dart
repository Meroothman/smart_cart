part of 'get_orders_cubit.dart';

abstract class GetOrdersState {}

class GetOrdersInitial extends GetOrdersState {}

class GetOrdersLoading extends GetOrdersState {}

class GetOrdersSuccess extends GetOrdersState {
  final List userOrders;

  GetOrdersSuccess(this.userOrders);
}

class GetOrdersError extends GetOrdersState {}

class NoOrders extends GetOrdersState {}

class GetOrderDetailsLoading extends GetOrdersState {}

class GetOrderDetailsSuccess extends GetOrdersState {}

class OrderDeleted extends GetOrdersState {}

class GetOrderDetailsError extends GetOrdersState {}
