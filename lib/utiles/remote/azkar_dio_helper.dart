import 'package:dio/dio.dart';

class AzkarDioHelper {
  static Dio? dio;

  static dioInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    final res = await dio!.get(
      url,
      queryParameters: query,
    );
    return res;
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    return await dio!.post(url, data: body);
  }
}
