import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:Auto_Shop/core/helper/cache_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) => BlocProvider.of(context);

  bool isAr = true;

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
