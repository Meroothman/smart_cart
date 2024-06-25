import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '/../core/utils/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../auth/data/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  static GetUserDataCubit get(context) => BlocProvider.of(context);
  late UserModel model;

  void getUserData(uId) async {
    if (uId != null) {
      emit(GetUserDataLoading());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        model = UserModel.fromJson(value.data()!);
        Constants.userName = model.name;

        emit(GetUserDataSuccess());
      }).catchError((e) {
        emit(GetUserDataFailure(error: e));
      });
    }
  }

  var picker = ImagePicker();
  File? image;

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      uploadImage(image);
      emit(GetImageSuccess());
    } else {
      emit(GetImageFailure());
    }
  }

  String uploadedImage = '';

  Future<void> uploadImage(image) async {
    try {
      // Create a reference to the Firebase Storage bucket
      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef =
          storageRef.child('images/${DateTime.now().toString()}.jpg');

      // Upload the file to Firebase Storage
      await imagesRef.putFile(image!);

      // Get the download URL
      final downloadUrl = await imagesRef.getDownloadURL();
      uploadedImage = downloadUrl;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.uId)
          .update({'image': downloadUrl});
      getUserData(Constants.uId);

      emit(UploadImageSuccess());
    } catch (e) {
      emit(UploadImageFailure());
    }
  }
}
