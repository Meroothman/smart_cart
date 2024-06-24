import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_cart_payment_project/core/helper/cache_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) => BlocProvider.of(context);

  bool isAr = false;

  void languageChange({language}) {
    if (language != null) {
      language == 'ar' ? isAr = true : isAr = false;
    } else {
      isAr = !isAr;
      if (isAr) {
        CacheHelper.saveData(key: "language", value: "ar");
      } else {
        CacheHelper.saveData(key: "language", value: "en");
      }
    }

    emit(LanguageChanged());
  }
}
