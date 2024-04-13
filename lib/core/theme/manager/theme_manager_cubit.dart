import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'theme_manager_state.dart';

class ThemeManagerCubit extends Cubit<ThemeManagerState> {
  ThemeManagerCubit() : super(ThemeManagerInitial());
}
