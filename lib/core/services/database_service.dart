abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
    bool? generatedId,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<void> deleteData({
    required String path,
    required String documentId,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
}
