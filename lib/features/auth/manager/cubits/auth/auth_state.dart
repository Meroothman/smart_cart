part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

//LOGIN STATES

// class LoginSuccess extends AuthState {}

// class LoginFailure extends AuthState {
//   final String message;

//   LoginFailure({required this.message});
// }

// class LoginLoading extends AuthState {}

//SIGN UP STATES

class SignupSuccess extends AuthState {}

class SignupFailure extends AuthState {
  final String message;

  SignupFailure({required this.message});
}

class SignupLoading extends AuthState {}

//Tail changed

class AuthScreenTailChanged extends AuthState {}
