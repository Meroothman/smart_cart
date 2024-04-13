import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '/../core/utils/constants.dart';

import '../../../../auth/data/user_model.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  static GetUserDataCubit get(context) => BlocProvider.of(context);
  late UserModel model;

  void getUserData() async {
    emit(GetUserDataLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.uId)
        .get()
        .then((value) {
      model = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccess());
    }).catchError((e) {
      emit(GetUserDataFailure(error: e));
    });
  }
}
