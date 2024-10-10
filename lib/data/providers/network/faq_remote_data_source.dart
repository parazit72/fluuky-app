import 'package:dio/dio.dart';
import 'package:fluuky/data/models/faq_model.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class HomeRemoteDataSource {
  final Dio _dio = DioProvider().createDio();

  Future<FaqResponse> fetchHomeData() async {
    try {
      final response = await _dio.get('/home');
      return FaqResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
