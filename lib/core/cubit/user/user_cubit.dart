import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_online_shop/core/helper_functions/get_user.dart';
import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepo authRepo;

  UserCubit(this.authRepo) : super(UserInitial()) {
    getUserData();
  }
  // UserEntity user = getUser();

  User? user;

  Future<void> getUserData() async {
    emit(GetUserLoading());

    try {
      final reselt = await authRepo.getUserData(uId: getCurrentUserId());
      emit(GetUserSuccess(user: reselt));
      await authRepo.saveUserLocally(
          user: UserEntity(
        uId: reselt.uId,
        email: reselt.email,
        name: reselt.name,
        phone: reselt.phone,
        image: reselt.image,
        address: reselt.address,
        createdAt: reselt.createdAt,
        updatedAt: reselt.updatedAt,
        status: reselt.status,
      ));
    } catch (e) {
      emit(GetUserFailed(errMessage: e.toString()));
    }
  }

  Future<void> signOut() async => await authRepo.signOut();

  Future<void> editUserImage({required String image}) async {
    try {
      emit(GetUserLoading());
      await authRepo.updateUserImage(
        uId: getCurrentUserId(),
        image: image,
      );
      await getUserData();
    } catch (e) {
      emit(GetUserFailed(errMessage: e.toString()));
    }
  }

  Future<void> editUser({required UserEntity user}) async {
    emit(EditUserLoading());
    try {
      await authRepo.updateUserData(user: user);
      emit(EditUserSuccess());
      await getUserData();
    } catch (e) {
      emit(EditUserFailed(errMessage: e.toString()));
    }
    // result.fold(
    //   (l) => emit(EditUserFailed(
    //     errMessage: l.message,
    //   )),
    //   (r) => emit(
    //     EditUserSuccess(
    //       user: user,
    //     ),
    //     await getUserData(),
    //   ),
    // );
  }

Future<void> updateEmail({required String newEmail}) async {
    emit(ChangeEmailLoading());
    try {
      // تحديث الإيميل في Firebase Auth
      await authRepo.updateUserEmail(newEmail: newEmail);
      
      // الحصول على بيانات المستخدم الحالي
      UserEntity currentUser = getUser();
      
      // تحديث بيانات المستخدم في Firestore
      UserEntity updatedUser = UserEntity(
        uId: currentUser.uId,
        email: newEmail,  // الإيميل الجديد
        name: currentUser.name,
        phone: currentUser.phone,
        image: currentUser.image,
        address: currentUser.address,
        createdAt: currentUser.createdAt,
        updatedAt: DateTime.now().toIso8601String(),
        status: currentUser.status,
      );

      // تحديث البيانات في Firestore
      await authRepo.updateUserData(user: updatedUser);
      
      // تحديث البيانات محلياً
      await authRepo.updateUserLocally(user: updatedUser);

      emit(ChangeEmailSuccess());
    } catch (e) {
      emit(ChangeEmailFailed(error: e.toString()));
    }
  }


  String getCurrentUserId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
