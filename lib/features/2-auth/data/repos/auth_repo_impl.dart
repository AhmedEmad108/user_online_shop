import 'dart:convert';
import 'dart:developer';
import 'package:user_online_shop/features/2-auth/data/model/user_model.dart';
import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/errors/exceptions.dart';
import 'package:user_online_shop/core/errors/failures.dart';
import 'package:user_online_shop/core/services/database_service.dart';
import 'package:user_online_shop/core/services/firebase_auth_service.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/core/utils/backend_endpoint.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image,
    required String address,
  }) async {
    User? user;

    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        uId: user.uid,
        email: email,
        name: name,
        phone: phone,
        image: image,
        address: address,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        status: true,
      );
      await user.sendEmailVerification();
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure(
          message: 'Something went wrong. Please try again later.'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.emailVerified) {
        var userEntity = await getUserData(uId: user.uid);
        await saveUserLocally(user: userEntity);
        return Right(userEntity);
      } else {
        await user.sendEmailVerification();
        return Left(ServerFailure(
            message:
                'Please verify your email address. A verification link has been sent to your email address. Once you verify your email address, you can log in to your account.'));
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure(
          message: 'Something went wrong. Please try again later.'));
    }
  }

  // @override
  // Future<Either<Failures, UserEntity>> signInWithGoogle() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithGoogle();
  //     var userEntity = UserModel.fromFirebaseUser(user);
  //     var isUserExist = await databaseService.checkIfDataExists(
  //       path: BackendEndpoint.userData,
  //       documentId: user.uid,
  //     );
  //     if (isUserExist) {
  //       await getUserData(uId: user.uid);
  //       await saveUserLocally(user: userEntity);
  //     } else {
  //       await addUserData(user: userEntity);
  //       await saveUserLocally(user: userEntity);
  //     }
  //     return Right(userEntity);
  //   } on CustomException catch (e) {
  //     await deleteUser(user);
  //     return Left(ServerFailure(message: e.message));
  //   } catch (e) {
  //     await deleteUser(user);
  //     log('Exception in signInWithGoogle: ${e.toString()}');
  //     return Left(ServerFailure(
  //         message: 'Something went wrong. Please try again later.'));
  //   }
  // }

  // @override
  // Future<Either<Failures, UserEntity>> signInWithFacebook() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithFacebook();
  //     var userEntity = UserModel.fromFirebaseUser(user);
  //     var isUserExist = await databaseService.checkIfDataExists(
  //       path: BackendEndpoint.userData,
  //       documentId: user.uid,
  //     );
  //     if (isUserExist) {
  //       await getUserData(uId: user.uid);
  //       await saveUserLocally(user: userEntity);
  //     } else {
  //       await addUserData(user: userEntity);
  //       await saveUserLocally(user: userEntity);
  //     }
  //     return Right(userEntity);
  //   } on CustomException catch (e) {
  //     await deleteUser(user);
  //     return Left(ServerFailure(message: e.message));
  //   } catch (e) {
  //     await deleteUser(user);
  //     log('Exception in signInWithFacebook: ${e.toString()}');
  //     return Left(ServerFailure(
  //         message: 'Something went wrong. Please try again later.'));
  //   }
  // }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.userData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future getUserData({required String uId}) async {
    try {
      var userData = await databaseService.getData(
        path: BackendEndpoint.userData,
        documentId: uId,
      );
      return UserModel.fromJson(userData);
    } catch (e) {
      log('Exception in getUserData: ${e.toString()}');
      return ServerFailure(message: e.toString());
    }
  }

  @override
  Future<Either<Failures, void>> updateUserData(
      {required UserEntity user}) async {
    try {
      await databaseService.updateData(
        path: BackendEndpoint.userData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateUserImage(
      {required String uId, required String image}) async {
    try {
      await databaseService.updateData(
        path: BackendEndpoint.userData,
        data: {'image': image},
        documentId: uId,
      );
      // await updateUserLocally(user: );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future updateUserLocally({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  @override
  Future saveUserLocally({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  @override
  Future deleteUserLocally() async {
    await Prefs.deleteString(kUserData);
  }

  @override
  Future signOut() async {
    await deleteUserLocally();
    await firebaseAuthService.signOut();
    // await Prefs.deleteAll();
  }

  @override
  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    await firebaseAuthService.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
  }
}
