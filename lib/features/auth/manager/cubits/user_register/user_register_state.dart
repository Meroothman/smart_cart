part of 'user_register_cubit.dart';

@immutable
abstract class UserRegisterState {}

final class UserRegisterInitial extends UserRegisterState {}

class RegisterSuccess extends UserRegisterState {
  final String uId;
  RegisterSuccess(this.uId);
}

class RegisterFailure extends UserRegisterState {
  final String message;

  RegisterFailure({required this.message});
}

class RegisterLoading extends UserRegisterState {}

class CreateFailure extends UserRegisterState {
  final String message;

  CreateFailure({required this.message});
}
