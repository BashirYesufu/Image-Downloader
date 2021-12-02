import 'package:dio/dio.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class Network {
  final Dio _dio = Dio();

  Future<void> fetchImage(String url) async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      var response = await _dio.download(
        url,
        '${directory.path}/image.jpg',
        onReceiveProgress: (received, total) {
          print('$received: $total');
          print(directory.path);
        },
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
