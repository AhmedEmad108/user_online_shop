import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image,
    required String address,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      phone: phone,
      image: image,
      address: address,
    );
    
    result.fold(
      (failure) {
        emit(SignUpError(message: failure.message));
      },
      (userEntity) {
        emit(SignUpSuccess(userEntity: userEntity));
      },
    );
  }
}
