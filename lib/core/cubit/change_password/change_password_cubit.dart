import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.authRepo) : super(ChangePasswordInitial());

  final AuthRepo authRepo;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    try {
      // الحصول على المستخدم الحالي
      final user = FirebaseAuth.instance.currentUser;

      // إنشاء بيانات اعتماد لإعادة المصادقة
      final cred = EmailAuthProvider.credential(
          email: user?.email ?? '', password: currentPassword);

      // إعادة المصادقة
      await user?.reauthenticateWithCredential(cred);

      // تغيير كلمة المرور
      await user?.updatePassword(newPassword);

      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(error: e.toString()));
    }
  }

  Future<void> changePassword2({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());

    try {
      await authRepo.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(error: e.toString()));
    }
  }
}

// class ChangePasswordCubit extends Cubit<ChangePasswordState> {
//   ChangePasswordCubit(this.authRepo) : super(ChangePasswordInitial());
//   final AuthRepo authRepo;

//   Future<void> changePassword({
//     required String currentPassword,
//     required String newPassword,
//   }) async {

//     emit(ChangePasswordLoading());

//     try {
//       await authRepo.changePassword(
//         currentPassword: currentPassword,
//         newPassword: newPassword,
//       );
//       emit(ChangePasswordSuccess());
//     } catch (e) {
//       emit(ChangePasswordFailure(error: e.toString()));
//     }
//   }
// }
