import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  bool loginIsActive = true;

  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  // late UserModel user;

  void changeScreenTail(bool state) {
    loginIsActive = state;
    emit(AuthScreenTailChanged());
  }
//   void login(String email, String password) async {
//     try {
//       emit(LoginLoading());

//       //CHECK AUTH USER
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then((value) {
//         print(">>>>>>>>>>>>>>>>>>>>>>${value.user}<<<<<<<<<<<<<<<<<<<<<<");
//       });

//       //GET USER DATA FROM USER COLLECTION
//       var userDoc = await users.doc(email).get();

//       //ASSIGN USER DATA TO USER MODEL
//       user = UserModel.fromJson(userDoc);
//       emit(LoginSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailure(message: 'No user found for that email.'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailure(message: 'Wrong password provided for that user.'));
//       } else if (e.code == 'user-disabled') {
//         emit(LoginFailure(message: 'User account has been disabled.'));
//       } else {
//         emit(LoginFailure(
//             message: 'Email or password is incorrect. Please try again.'));
//       }
//     }
//   }

//   void signup(String email, String password, String fName, String lName,
//       String phone) async {
//     try {
//       emit(SignupLoading());

//       //ADD AUTH USER
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       )
//           .then((value) {
//         print(">>>>>>>>>>>>>>>>>>>>>>${value.user}<<<<<<<<<<<<<<<<<<<<<<");
//       });

//       //ADD USER TO USER COLLECTION
//       await users.doc(email).set({
//         'name': '$fName $lName',
//         'email': email,
//         'password': password,
//         'phone': phone
//       });

//       //GET USER DATA FROM USER COLLECTION
//       var userDoc = await users.doc(email).get();

//       //ASSIGN USER DATA TO USER MODEL
//       user = UserModel.fromJson(userDoc);

//       emit(SignupSuccess());
//   //   } on FirebaseAuthException catch (e) {
//   //     if (e.code == 'weak-password') {
//   //       emit(SignupFailure(message: 'The password provided is too weak.'));
//   //     } else if (e.code == 'email-already-in-use') {
//   //       emit(SignupFailure(message: 'Email already in use.'));
//   //     } else if (e.code == 'invalid-email') {
//   //       emit(SignupFailure(message: 'The email address is invalid.'));
//   //     }
//   //   } catch (e) {
//   //     emit(SignupFailure(
//   //       message: e.toString(),
//   //     ));
//   //   }
//   // }
}
