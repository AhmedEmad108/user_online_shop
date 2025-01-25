import 'package:bloc/bloc.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangState(locale: 'en'));
  Future<void> changeLang({required String lang}) async {
    await Prefs.setString('lang', lang);
    emit(LangState(
      locale: lang,
    ));
  }
}
