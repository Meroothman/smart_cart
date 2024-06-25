import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:Auto_Shop/generated/l10n.dart';

import '../../../../../core/helper/cache_helper.dart';
import '../../../../../core/utils/constants.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());
  static UserLoginCubit get(context) => BlocProvider.of(context);

  void userLogin(String email, String password, context) async {
    emit(LoginLoading());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Constants.uId = value.user!.uid;
      CacheHelper.saveData(key: "uId", value: value.user!.uid);
      emit(LoginSuccess(value.user!.uid));
    }).catchError((e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(message: S.of(context).user_not_found_text));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(message: S.of(context).wrong_password_text));
      } else if (e.code == 'user-disabled') {
        emit(LoginFailure(message: S.of(context).user_disabled_text));
      } else {
        emit(LoginFailure(message: S.of(context).failure_text));
      }
    });
  }
}
