import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_cart_payment_project/features/auth/data/user_model.dart';

part 'user_register_state.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  UserRegisterCubit() : super(UserRegisterInitial());

  static UserRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
    String email,
    String password,
    String fName,
    String lName,
    String phone,
  ) async {
    emit(RegisterLoading());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(fName, lName, phone, email, value.user!.uid);
    }).catchError((e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(message: 'Email already in use.'));
      } else if (e.code == 'invalid-email') {
        emit(RegisterFailure(message: 'The email address is invalid.'));
      } else {
        emit(RegisterFailure(
            message: 'Something went wrong , please try again.'));
      }
    });
  }

  userCreate(String fName, String lName, String phone, String email,
      String uId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    UserModel user = UserModel(
        name: '$fName $lName',
        email: email,
        phone: phone,
        uId: uId,
        isEmailVerified: false,
        image:
            'https://as2.ftcdn.net/v2/jpg/00/64/67/63/1000_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg');
    print(user.toMap());

    await users.doc(uId).set({
      "name": '$fName $lName',
      "email": email,
      "phone": phone,
      "uId": uId,
      "isEmailVerified": false,
      "image":
          'https://as2.ftcdn.net/v2/jpg/00/64/67/63/1000_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
    }).then((value) {
      emit(RegisterSuccess(uId));
    }).catchError((error) {
      emit(CreateFailure(message: error));
    });
  }
}
