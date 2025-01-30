import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';

part 'edit_email_state.dart';

class EditEmailCubit extends Cubit<EditEmailState> {
  EditEmailCubit(this.authRepo) : super(EditEmailInitial());
  final AuthRepo authRepo;

  Future<void> updateEmail({required String newEmail}) async {
    emit(EditEmailLoading());
    try {
      await authRepo.updateUserEmail(newEmail: newEmail);
      emit(EditEmailSuccess());
    } catch (e) {
      emit(EditEmailFailed(error: e.toString()));
    }
  }
}
