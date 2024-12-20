part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataLoading extends GetUserDataState {}

final class GetUserDataSuccess extends GetUserDataState {
  GetUserDataSuccess();
}

final class GetUserDataFailure extends GetUserDataState {
  GetUserDataFailure({required this.error});

  final String error;
}

final class GetImageSuccess extends GetUserDataState {}

final class GetImageFailure extends GetUserDataState {}

final class UploadImageSuccess extends GetUserDataState {}

final class UploadImageFailure extends GetUserDataState {}
