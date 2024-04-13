part of 'change_user_data_cubit.dart';

@immutable
sealed class ChangeUserDataState {}

final class ChangeUserDataInitial extends ChangeUserDataState {}

final class ChangeUserDataLoading extends ChangeUserDataState {}

final class ChangeUserDataSuccess extends ChangeUserDataState {}

final class ChangeUserDataFailure extends ChangeUserDataState {
  final String error;

  ChangeUserDataFailure({required this.error});
}
