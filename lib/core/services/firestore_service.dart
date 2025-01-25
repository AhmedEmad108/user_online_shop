import 'package:user_online_shop/core/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
    bool? generatedId,
  }) async {
    if (generatedId == true) {
      DocumentReference docRef = firestore.collection(path).doc();
      String generatedId = docRef.id;
      data['id'] = generatedId;
      await docRef.set(data);
    } else if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      // إنشاء query أساسي
      Query<Map<String, dynamic>> queryRef = firestore.collection(path);

      // إضافة الفلاتر إذا وجدت
      if (query != null) {
        // فلترة حسب الحالة
        if (query['status'] != null) {
          queryRef = queryRef.where('status', isEqualTo: query['status']);
        }

        // الترتيب إذا كان موجود
        if (query['orderBy'] != null) {
          queryRef = queryRef.orderBy(
            query['orderBy'],
            descending: query['descending'] ?? false,
          );
        }

        // تحديد العدد إذا كان موجود
        if (query['limit'] != null) {
          queryRef = queryRef.limit(query['limit']);
        }
      }

      // تنفيذ الاستعلام
      var snapshot = await queryRef.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    }
  }

  // @override
  // Future<dynamic> getData(
  //     {required String path,
  //     String? documentId,
  //     Map<String, dynamic>? query}) async {
  //   if (documentId != null) {
  //     var data = await firestore.collection(path).doc(documentId).get();
  //     return data.data();
  //   } else if (query != null) {
  //     Query<Map<String, dynamic>> data = firestore.collection(path);

  //     if (query['orderBy'] != null) {
  //       var orderByField = query['orderBy'];
  //       var descending = query['descending'];
  //       data = data.orderBy(orderByField, descending: descending == descending);
  //     }

  //     if (query['limit'] != null) {
  //       var limit = query['limit'];
  //       data = data.limit(limit);
  //     }

  //     var result = await data.get();
  //     return result.docs.map((e) => e.data()).toList();
  //   } else {
  //     var data = await firestore.collection(path).get();
  //     return data.docs.map((e) => e.data()).toList();
  //   }
  // }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> deleteData(
      {required String path, required String documentId}) async {
    await firestore.collection(path).doc(documentId).delete();
  }

  @override
  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    await firestore.collection(path).doc(documentId).update(data);
  }


   // إضافة دالة جديدة تعيد Stream
  Stream<List<Map<String, dynamic>>> getDataStream({
    required String path,
    Map<String, dynamic>? query,
  }) {
    Query<Map<String, dynamic>> ref = firestore.collection(path);

    if (query != null) {
      if (query['status'] != null) {
        ref = ref.where('status', isEqualTo: query['status']);
      }
      if (query['orderBy'] != null) {
        ref = ref.orderBy(
          query['orderBy'],
          descending: query['descending'] ?? false,
        );
      }
    }

    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }


 // إضافة دالة جديدة للبحث
  Future<List<Map<String, dynamic>>> searchData({
    required String path,
    required String searchField,
    required String query,
    bool? status,
  }) async {
    Query<Map<String, dynamic>> ref = firestore.collection(path);
    
    // إضافة فلتر الحالة إذا كان مطلوباً
    if (status != null) {
      ref = ref.where('status', isEqualTo: status);
    }

    var snapshot = await ref.get();
    var allData = snapshot.docs.map((doc) {
      var data = doc.data();
      data['id'] = doc.id; // إضافة ID للبيانات
      return data;
    }).toList();

    // البحث في الحقول المطلوبة
    return allData.where((doc) {
      String fieldValue = doc[searchField]?.toString().toLowerCase() ?? '';
      return fieldValue.contains(query.toLowerCase());
    }).toList();
  }
}
