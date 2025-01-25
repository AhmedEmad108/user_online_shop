import 'dart:convert';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/features/2-auth/data/model/user_model.dart';
import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
