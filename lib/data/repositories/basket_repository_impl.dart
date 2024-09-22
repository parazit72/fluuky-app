import 'package:dio/dio.dart';
import 'package:fluuky/data/models/basket_model.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class BasketRepositoryImpl implements BasketRepository {
  final Dio _dio;

  BasketRepositoryImpl() : _dio = DioProvider().createDio();

  @override
  Future<BasketModel> fetchBasket() async {
    try {
      final response = await _dio.get('/basket');
      final Map<String, dynamic> itemList = response.data['data'];
      return BasketModel.fromJson(itemList);
    } catch (e) {
      if (e is DioException) {
        // Check the HTTP status code
        if (e.response?.statusCode == 422) {
          throw Exception('Validation failed: Invalid email or password.');
        } else if (e.response?.statusCode == 401) {
          throw Exception('Unauthorized: Incorrect credentials.');
        } else if (e.response?.statusCode == 500) {
          throw Exception('Server error: Please try again later.');
        } else {
          // Handle other Dio-specific errors
          throw Exception('Failed to login: ${e.response?.statusMessage}');
        }
      } else {
        // Handle non-Dio errors
        throw Exception('Unexpected error: $e');
      }
    }
  }
}
