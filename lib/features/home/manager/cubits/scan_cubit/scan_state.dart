part of 'scan_cubit.dart';

@immutable
sealed class ScanState {}

final class ScanCubitInitial extends ScanState {}

final class ScanningSuccess extends ScanState {
  final String cartId;

  ScanningSuccess({required this.cartId});
}

final class ScanningError extends ScanState {
  final String error;

  ScanningError({required this.error});
}
