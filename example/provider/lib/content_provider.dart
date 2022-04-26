import 'package:android_content_provider/android_content_provider.dart';

class MyAndroidContentProvider extends AndroidContentProvider {
  MyAndroidContentProvider(String authority) : super(authority);

  @override
  Future<int> delete(
    String uri,
    String? selection,
    List<String>? selectionArgs,
  ) async {
    final parsedUri = Uri.parse(uri);
    
    if (parsedUri.path == "/clearTokens") {
      print("Yes");
    }
    return 1;
  }

  @override
  Future<String?> getType(String uri) async {
    return null;
  }

  @override
  Future<String?> insert(String uri, ContentValues? values) async {
    return null;
  }

  @override
  Future<CursorData?> query(
    String uri,
    List<String>? projection,
    String? selection,
    List<String>? selectionArgs,
    String? sortOrder,
  ) async {
    MatrixCursorData matrixCursorData = MatrixCursorData(
        columnNames: ["test", "test1"], notificationUris: [uri]);
    matrixCursorData.newRow().add("1").add("2");

    return matrixCursorData;
  }

  @override
  Future<int> update(
    String uri,
    ContentValues? values,
    String? selection,
    List<String>? selectionArgs,
  ) async {
    return 0;
  }
}
