import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  bool loginIsActive = true;

  void changeScreenTail(bool state) {
    loginIsActive = state;
    emit(AuthScreenTailChanged());
  }

  void loadingState(bool state) {
    isLoading = state;
    emit(LoadingStateChanged());
  }
}
