part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderError extends OrderState {}

final class OrderAdded extends OrderState {}

final class OrderFinished extends OrderState {}
