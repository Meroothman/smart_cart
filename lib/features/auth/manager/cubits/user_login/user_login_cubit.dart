import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helper/cache_helper.dart';
import '../../../../../core/utils/constants.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());
  static UserLoginCubit get(context) => BlocProvider.of(context);

  void userLogin(String email, String password) async {
    emit(LoginLoading());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Constants.uId = value.user!.uid;
      CacheHelper.saveData(key: "uId", value: value.user!.uid);
      emit(LoginSuccess(value.user!.uid));
    }).catchError((e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(message: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(message: 'Wrong password provided for that user.'));
      } else if (e.code == 'user-disabled') {
        emit(LoginFailure(message: 'User account has been disabled.'));
      } else {
        emit(LoginFailure(
            message: 'Email or password is incorrect. Please try again.'));
      }
    });
  }
}
