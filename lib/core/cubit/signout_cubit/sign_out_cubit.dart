import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());
  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await authRepo.signOut();
      Prefs.deleteString(
        kUserData,
      );
      emit(SignOutSuccess());
    } catch (e) {
      emit(SignOutError(message: e.toString()));
    }
  }
}
