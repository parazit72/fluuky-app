import 'package:dio/dio.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class HomeRepositoryImpl {
  final Dio _dio = DioProvider().createDio();

  Future<Map<String, dynamic>?> getHomeInfo() async {
    try {
      final response = await _dio.get('/home');
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print("Error fetching home data: $e");
    }
    return null;
  }
}
