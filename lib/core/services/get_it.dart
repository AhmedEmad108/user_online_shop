import 'package:user_online_shop/core/services/database_service.dart';
import 'package:user_online_shop/core/services/firebase_auth_service.dart';
import 'package:user_online_shop/core/services/firestore_service.dart';
import 'package:user_online_shop/core/services/storage_service.dart';
import 'package:user_online_shop/core/services/supabase_storage.dart';
import 'package:user_online_shop/features/2-auth/data/repos/auth_repo_impl.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<VendorRepo>(
    VendorRepoImpl(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  // getIt.registerSingleton<ImagesRepo>(
  //     ImagesRepoImpl(storageService: getIt.get<StorageService>()));
  // getIt.registerSingleton<ProductsRepo>(
  //     ProductsRepoImpl(databaseService: getIt.get<DatabaseService>()));
}
