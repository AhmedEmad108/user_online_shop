// // vendor_model.dart
// import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserModel extends UserEntity {
//   final String uId;
//   final String nameEn;
//   final String email;
//   final String phone;
//   final String image;
//   final String address;
//   final bool status;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   const UserModel({
//     required this.uId,
//     required this.nameEn,
//     required this.email,
//     required this.phone,
//     required this.image,
//     required this.address,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory UserModel.fromFirebaseUser(User user) {
//     return UserModel(
//       uId: user.uid,
//       email: user.email ?? '',
//       nameEn: user.displayName ?? '',
//       phone: user.phoneNumber ?? '',
//       image: user.photoURL ?? '',
//       address: '',
//       status: false,
//       createdAt: DateTime.now(),
//     );
//   }

//   factory UserModel.fromJson(Map<String, dynamic> map) {
//     return UserModel(
//       uId: map['id'] as String,
//       nameEn: map['name_en'] as String,
//       email: map['email'] as String,
//       phone: map['phone'] as String,
//       image: map['image'] as String,
//       address: map['address'] as String,
//       status: map['status'] as bool,
//       createdAt: DateTime.parse(map['created_at'] as String),
//     );
//   }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': uId,
//   //     'name_ar': nameAr,
//   //     'name_en': nameEn,
//   //     'email': email,
//   //     'phone': phone,
//   //     'image': image,
//   //     'address': address,
//   //     'status': status,
//   //     'created_at': createdAt.toIso8601String(),
//   //     'product_ids': productIds,
//   //     'settings': settings,
//   //     'rating': rating,
//   //     'total_orders': totalOrders,
//   //     'balance': balance,
//   //   };
//   // }

//   // UserEntity toEntity() {
//   //   return UserEntity(
//   //     uId: uId,
//   //     nameAr: nameAr,
//   //     nameEn: nameEn,
//   //     email: email,
//   //     phone: phone,
//   //     image: image,
//   //     address: address,
//   //     status: status,
//   //     createdAt: createdAt,
//   //     productIds: productIds,
//   //     settings: settings,
//   //     rating: rating,
//   //     totalOrders: totalOrders,
//   //     balance: balance,
//   //   );
//   // }

//   factory UserModel.fromEntity(UserEntity user) {
//     return UserModel(
//       uId: user.uId,
//       nameEn: user.nameEn,
//       email: user.email,
//       phone: user.phone,
//       image: user.image,
//       address: user.address,
//       status: user.status,
//       createdAt: user.createdAt,
//     );
//   }

//   toMap() {
//     return {
//       'uId': uId,
//       'email': email,
//       'nameEn': nameEn,
//       'phone': phone,
//       'image': image,
//       'address': address,
//       'status': status,
//       'createdAt': createdAt,
//     };
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uId,
    required super.email,
    required super.name,
    required super.phone,
    required super.image,
    required super.address,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      phone: user.phoneNumber ?? '',
      image: user.photoURL ?? '',
      address: '',
      status: true,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'],
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      image: map['image'],
      address: map['address'],
      status: map['status'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uId: user.uId,
      email: user.email,
      name: user.name,
      phone: user.phone,
      image: user.image,
      address: user.address,
      status: user.status,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  toMap() {
    return {
      'uId': uId,
      'email': email,
      'name': name,
      'phone': phone,
      'image': image,
      'address': address,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
