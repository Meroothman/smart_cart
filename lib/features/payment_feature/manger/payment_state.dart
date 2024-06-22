part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

// ignore: must_be_immutable
final class PaymentFailure extends PaymentState {
 String errorMessage ="some thing went wrong, please try again";

  PaymentFailure({required this.errorMessage});
  
}
