import 'dart:io';
import 'package:user_online_shop/core/services/storage_service.dart';
import 'package:user_online_shop/core/utils/backend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService extends StorageService {
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://xiuxhprmrgmowqaovisl.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhpdXhocHJtcmdtb3dxYW92aXNsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0MTg5ODAyNiwiZXhwIjoyMDU3NDc0MDI2fQ.wVcO-qzRZ7hyA7GA1jGWmGKz9i-Km6KjVFB7Jeap5bo',
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFrbWp0dnhhcXNsb2Z1cWV1ZG90Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMzI2MDA0NSwiZXhwIjoyMDQ4ODM2MDQ1fQ.nQjyDQWg7RcD5KQ6i5R5r-BKGAOSMevG8z9mirLpCMU',
    );
  }

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    try {
      String fileName = b.basename(file.path);
      var storageReference =
          _supabase.client.storage.from(BackendEndpoint.images);

      // Fetch existing files
      final List<FileObject> objects = await storageReference.list();

      // Check if file already exists
      bool fileExists = objects.any((element) => element.name == fileName);
      if (fileExists) {
        // Return public URL if file exists
        return storageReference.getPublicUrl(fileName);
      } else {
        // Upload file and return its URL
        await storageReference.upload(fileName, file);
        return storageReference.getPublicUrl(fileName);
      }
    } catch (e) {
      return '';
    }
  }
}


// import 'dart:io';
// import 'package:online_shop_dashboard/core/services/storage_service.dart';
// import 'package:online_shop_dashboard/core/utils/backend_endpoint.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:path/path.dart' as b;

// class SupabaseStorageService extends StorageService {
//   static late Supabase _supabase;

//   static initSupabase() async {
//     _supabase = await Supabase.initialize(
//       url: 'https://qkmjtvxaqslofuqeudot.supabase.co',
//       anonKey:
//           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFrbWp0dnhhcXNsb2Z1cWV1ZG90Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMzI2MDA0NSwiZXhwIjoyMDQ4ODM2MDQ1fQ.nQjyDQWg7RcD5KQ6i5R5r-BKGAOSMevG8z9mirLpCMU',
//     );
//   }

//   @override
//   Future<String> uploadFile({required File file, required String path}) async {
//     String fileName = b.basename(file.path);
//     String extentionName = b.extension(file.path);
//     var imageRefrence = _supabase.client.storage.from(BackendEndpoint.images);
//     final List<FileObject> objects =
//         await _supabase.client.storage.from(BackendEndpoint.images).list();
//     print(objects);
//     if (objects.isNotEmpty) {
//       for (var element in objects) {
//         if (element.name == '$fileName.$extentionName') {
//           print(element.name);
//           var imageUrl = _supabase.client.storage
//               .from(BackendEndpoint.images)
//               .getPublicUrl('$fileName.$extentionName');
//           return imageUrl;
//         } else {
//           await imageRefrence.upload('$fileName.$extentionName', file);
//           var imageUrl = _supabase.client.storage
//               .from(BackendEndpoint.images)
//               .getPublicUrl('$fileName.$extentionName');
//           return imageUrl;
//         }
//       }
//     } else {
//       await imageRefrence.upload('$fileName.$extentionName', file);
//       var imageUrl = _supabase.client.storage
//           .from(BackendEndpoint.images)
//           .getPublicUrl('$fileName.$extentionName');
//       return imageUrl;
//     }
//     return '';
//     // var imageUrl = imageRefrence.getPublicUrl('$path/$fileName.$extentionName');
//   }
// }