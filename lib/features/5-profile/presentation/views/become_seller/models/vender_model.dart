// vendor_stats_entity.dart
import 'package:dartz/dartz.dart';
import 'package:user_online_shop/core/errors/failures.dart';
import 'package:user_online_shop/core/services/database_service.dart';
import 'package:user_online_shop/core/services/firestore_service.dart';
import 'package:user_online_shop/core/utils/backend_endpoint.dart';

// vendor_entity.dart
class VendorEntity {
  final String id;
  final String nameVendorAr;
  final String nameVendorEn;
  final String email;
  final String phone;
  final String image;
  final String coverImage;
  final String address;
  final String status;
  final String createdAt;
  final String updatedAt;
  final List<String> productIds;
  final Map<String, dynamic> settings;
  final double rating;
  final int totalOrders;
  final double balance;
  final List<String> additionalImages;

  const VendorEntity({
    required this.id,
    required this.nameVendorAr,
    required this.nameVendorEn,
    required this.email,
    required this.phone,
    required this.image,
    required this.coverImage,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.productIds,
    required this.settings,
    required this.rating,
    required this.totalOrders,
    required this.balance,
    this.additionalImages = const [],
  });

  factory VendorEntity.fromJson(Map<String, dynamic> json) {
    return VendorEntity(
      id: json['id'] as String,
      nameVendorAr: json['nameVendorAr'] as String,
      nameVendorEn: json['nameVendorEn'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      coverImage: json['coverImage'] as String,
      address: json['address'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      productIds: json['productIds'] as List<String>,
      settings: json['settings'] as Map<String, dynamic>,
      rating: json['rating'] as double,
      totalOrders: json['totalOrders'] as int,
      balance: json['balance'] as double,
      additionalImages: json['additionalImages'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameVendorAr': nameVendorAr,
      'nameVendorEn': nameVendorEn,
      'email': email,
      'phone': phone,
      'image': image,
      'coverImage': coverImage,
      'address': address,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'productIds': productIds,
      'settings': settings,
      'rating': rating,
      'totalOrders': totalOrders,
      'balance': balance,
      'additionalImages': additionalImages,
    };
  }

  VendorModel toModel() {
    return VendorModel(
      id: id,
      nameVendorAr: nameVendorAr,
      nameVendorEn: nameVendorEn,
      email: email,
      phone: phone,
      image: image,
      coverImage: coverImage,
      address: address,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      productIds: productIds,
      settings: settings,
      rating: rating,
      totalOrders: totalOrders,
      balance: balance,
      additionalImages: additionalImages,
    );
  }

  VendorEntity toEntity() {
    return VendorEntity(
      id: id,
      nameVendorAr: nameVendorAr,
      nameVendorEn: nameVendorEn,
      email: email,
      phone: phone,
      image: image,
      coverImage: coverImage,
      address: address,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      productIds: productIds,
      settings: settings,
      rating: rating,
      totalOrders: totalOrders,
      balance: balance,
      additionalImages: additionalImages,
    );
  }

  factory VendorEntity.fromModel(VendorModel model) {
    return VendorEntity(
      id: model.id,
      nameVendorAr: model.nameVendorAr,
      nameVendorEn: model.nameVendorEn,
      email: model.email,
      phone: model.phone,
      image: model.image,
      coverImage: model.coverImage,
      address: model.address,
      status: model.status,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      productIds: model.productIds,
      settings: model.settings,
      rating: model.rating,
      totalOrders: model.totalOrders,
      balance: model.balance,
      additionalImages: model.additionalImages,
    );
  }

  factory VendorEntity.fromSnapshot(Map<String, dynamic> snapshot) {
    return VendorEntity(
      id: snapshot['id'] as String,
      nameVendorAr: snapshot['nameVendorAr'] as String,
      nameVendorEn: snapshot['nameVendorEn'] as String,
      email: snapshot['email'] as String,
      phone: snapshot['phone'] as String,
      image: snapshot['image'] as String,
      coverImage: snapshot['coverImage'] as String,
      address: snapshot['address'] as String,
      status: snapshot['status'] as String,
      createdAt: snapshot['createdAt'] as String,
      updatedAt: snapshot['updatedAt'] as String,
      productIds: List<String>.from(snapshot['productIds'] as List),
      settings: snapshot['settings'] as Map<String, dynamic>,
      rating: snapshot['rating'] as double,
      totalOrders: snapshot['totalOrders'] as int,
      balance: snapshot['balance'] as double,
      additionalImages: List<String>.from(snapshot['additionalImages'] as List),
    );
  }

  toMap() {
    return {
      'id': id,
      'nameVendorAr': nameVendorAr,
      'nameVendorEn': nameVendorEn,
      'email': email,
      'phone': phone,
      'image': image,
      'coverImage': coverImage,
      'address': address,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'productIds': productIds,
      'settings': settings,
      'rating': rating,
      'totalOrders': totalOrders,
      'balance': balance,
      'additionalImages': additionalImages,
    };
  }
}

// vendor_model.dart
class VendorModel {
  final String id;
  final String nameVendorAr;
  final String nameVendorEn;
  final String email;
  final String phone;
  final String image;
  final String coverImage;
  final String address;
  final String status;
  final String createdAt;
  final String updatedAt;
  final List<String> productIds;
  final Map<String, dynamic> settings;
  final double rating;
  final int totalOrders;
  final double balance;
  final List<String> additionalImages;

  const VendorModel({
    required this.id,
    required this.nameVendorAr,
    required this.nameVendorEn,
    required this.email,
    required this.phone,
    required this.image,
    required this.coverImage,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.productIds,
    required this.settings,
    required this.rating,
    required this.totalOrders,
    required this.balance,
    this.additionalImages = const [],
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] as String,
      nameVendorAr: json['name_ar'] as String,
      nameVendorEn: json['name_en'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      coverImage: json['cover_image'] as String,
      address: json['address'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      productIds: List<String>.from(json['product_ids'] as List),
      settings: json['settings'] as Map<String, dynamic>,
      rating: (json['rating'] as num).toDouble(),
      totalOrders: json['total_orders'] as int,
      balance: (json['balance'] as num).toDouble(),
      additionalImages: json['additional_images'] != null
          ? List<String>.from(json['additional_images'] as List)
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameVendorAr,
      'name_en': nameVendorEn,
      'email': email,
      'phone': phone,
      'image': image,
      'cover_image': coverImage,
      'address': address,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'product_ids': productIds,
      'settings': settings,
      'rating': rating,
      'total_orders': totalOrders,
      'balance': balance,
      'additional_images': additionalImages,
    };
  }

  VendorEntity toEntity() {
    return VendorEntity(
      id: id,
      nameVendorAr: nameVendorAr,
      nameVendorEn: nameVendorEn,
      email: email,
      phone: phone,
      image: image,
      coverImage: coverImage,
      address: address,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      productIds: productIds,
      settings: settings,
      rating: rating,
      totalOrders: totalOrders,
      balance: balance,
      additionalImages: additionalImages,
    );
  }

  factory VendorModel.fromEntity(VendorEntity entity) {
    return VendorModel(
      id: entity.id,
      nameVendorAr: entity.nameVendorAr,
      nameVendorEn: entity.nameVendorEn,
      email: entity.email,
      phone: entity.phone,
      image: entity.image,
      coverImage: entity.coverImage,
      address: entity.address,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      productIds: entity.productIds,
      settings: entity.settings,
      rating: entity.rating,
      totalOrders: entity.totalOrders,
      balance: entity.balance,
      additionalImages: entity.additionalImages,
    );
  }
}

// vendor_repo.dart
abstract class VendorRepo {
  Future<Either<Failures, void>> addVendor(VendorEntity vendor);
  Future<Either<Failures, void>> updateVendor(VendorEntity vendor);
  Future<Either<Failures, void>> deleteVendor(String id);
  Future<Either<Failures, List<VendorEntity>>> getAllVendors();
  Future<Either<Failures, VendorEntity>> getVendorById(String id);
  Future<Either<Failures, void>> updateVendorStatus(
      {required String vendorId, required bool newStatus});
  Future<Either<Failures, VendorEntity>> getVendorStats(String vendorId);
  // Future<Either<Failures, List<ProductEntity>>> getVendorProducts(String vendorId);
  // Future<Either<Failures, List<OrderEntity>>> getVendorOrders(String vendorId);
  Stream<List<VendorEntity>> getVendorStream({bool? activeOnly});
}

// vendor_repo_impl.dart
class VendorRepoImpl implements VendorRepo {
  final DatabaseService databaseService;

  VendorRepoImpl({required this.databaseService});

  @override
  Future<Either<Failures, void>> addVendor(VendorEntity vendor) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.vendors,
        data: VendorModel.fromEntity(vendor).toJson(),
        documentId: vendor.id,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateVendor(VendorEntity vendor) async {
    try {
      await databaseService.updateData(
        path: BackendEndpoint.vendors,
        data: VendorModel.fromEntity(vendor).toJson(),
        documentId: vendor.id,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> deleteVendor(String id) async {
    try {
      await databaseService.deleteData(
        path: BackendEndpoint.vendors,
        documentId: id,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<VendorEntity>>> getAllVendors() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpoint.vendors,
      ) as List<Map<String, dynamic>>;

      List<VendorModel> vendors =
          data.map((e) => VendorModel.fromJson(e)).toList();
      List<VendorEntity> vendorsEntity =
          vendors.map((e) => e.toEntity()).toList();
      return Right(vendorsEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, VendorEntity>> getVendorById(String id) async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpoint.vendors,
        documentId: id,
      );

      VendorModel vendor = VendorModel.fromJson(data);
      return Right(vendor.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateVendorStatus({
    required String vendorId,
    required bool newStatus,
  }) async {
    try {
      await databaseService.updateData(
        path: BackendEndpoint.vendors,
        data: {'status': newStatus},
        documentId: vendorId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<List<VendorEntity>> getVendorStream({bool? activeOnly}) {
    Map<String, dynamic>? query;
    if (activeOnly != null) {
      query = {'status': activeOnly};
    }
    return (databaseService as FirestoreService)
        .getDataStream(
          path: BackendEndpoint.vendors,
          query: query,
        )
        .map((data) => data
            .map((json) => VendorModel.fromJson(json))
            .map((model) => model.toEntity())
            .toList());
  }

  @override
  Future<Either<Failures, VendorEntity>> getVendorStats(String vendorId) {
    // TODO: implement getVendorStats
    throw UnimplementedError();
  }
}
