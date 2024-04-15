part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderReloading extends OrderState {}

final class OrderAdded extends OrderState {}

final class AddProductSuccess extends OrderState {}

final class GetProductsSuccess extends OrderState {
  final List<ProductModel> products;
  final int totalPrice;

  GetProductsSuccess({required this.products, required this.totalPrice});
}

final class ProductIncreasedQuantity extends OrderState {}

final class ProductDecreasedQuantity extends OrderState {}

final class StartOrderError extends OrderState {
  final String error;

  StartOrderError({required this.error});
}

final class GetProductsError extends OrderState {
  final String error;

  GetProductsError({required this.error});
}

final class AddProductError extends OrderState {
  final String error;

  AddProductError({required this.error});
}

final class FinishOrderError extends OrderState {
  final String error;

  FinishOrderError({required this.error});
}

final class OrderFinished extends OrderState {}

final class CancelOrderSuccess extends OrderState {}

final class CancelOrderError extends OrderState {}
