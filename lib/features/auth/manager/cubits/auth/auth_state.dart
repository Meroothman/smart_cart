part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingStateChanged extends AuthState {}

class AuthScreenTailChanged extends AuthState {}
