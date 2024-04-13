part of 'user_login_cubit.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

class LoginSuccess extends UserLoginState {
  final String uId;
  LoginSuccess(this.uId);
}

class LoginFailure extends UserLoginState {
  final String message;

  LoginFailure({required this.message});
}

class LoginLoading extends UserLoginState {}
