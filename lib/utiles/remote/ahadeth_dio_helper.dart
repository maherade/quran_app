import 'package:dio/dio.dart';

class AhadethDioHelper {
  static Dio? dio;

  static dioInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://hadis-api-id.vercel.app',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
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
