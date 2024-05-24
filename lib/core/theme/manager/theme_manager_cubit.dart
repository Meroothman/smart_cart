// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:smart_cart_payment_project/core/helper/cache_helper.dart';
// part 'theme_manager_state.dart';

// class ThemeManagerCubit extends Cubit<ThemeManagerState> {
//   ThemeManagerCubit() : super(ThemeManagerInitial());
//   static ThemeManagerCubit get(context) =>
//       BlocProvider.of<ThemeManagerCubit>(context);

//   bool isDark = false;

//   void themeChange({bool? cacheValue}) {
//     if (cacheValue == null) {
//       isDark = !isDark;
//       CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
//         emit(ThemeModeChanged());
//       });
//     } else {
//       isDark = cacheValue;
//     }
//   }
// }
