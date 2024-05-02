import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '/../core/utils/constants.dart';
part 'change_user_data_state.dart';

class ChangeUserDataCubit extends Cubit<ChangeUserDataState> {
  ChangeUserDataCubit() : super(ChangeUserDataInitial());
  static ChangeUserDataCubit get(context) => BlocProvider.of(context);
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  changeUserData(String key, String updateValue) async {
    emit(ChangeUserDataLoading());
    await users.doc(Constants.uId).update({key: updateValue}).then((value) {
      emit(ChangeUserDataSuccess());
    }).catchError((error) {
      emit(ChangeUserDataFailure(error: error));
    });
  }
}
