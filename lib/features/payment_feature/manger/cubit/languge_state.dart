part of 'languge_cubit.dart';

@immutable
sealed class LangugeState {}

final class LangugeInitial extends LangugeState {}

final class LangugeChanged extends LangugeState {}