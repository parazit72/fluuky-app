import 'package:dio/dio.dart';
import 'package:fluuky/data/models/basket_model.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class BasketRepositoryImpl implements BasketRepository {
  final Dio _dio;

  BasketRepositoryImpl() : _dio = DioProvider().createDio();

  @override
  Future<BasketModel?> fetchBasket() async {
    try {
      final response = await _dio.get('/basket');

      final Map<String, dynamic> itemList = response.data['data'];
      return BasketModel.fromJson(itemList);
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  @override
  Future<void> addToBasket(int raffleId, int quantity) async {
    try {
      await _dio.post('/cart');
    } catch (e) {
      handleError(e);
    }
  }

  @override
  Future<void> clearBasket() async {
    try {
      await _dio.delete('/basket/clear');
    } catch (e) {
      handleError(e);
    }
  }

  void handleError(dynamic e) {
    if (e is DioException) {
      // Check the HTTP status code
      if (e.response?.statusCode == 422) {
        throw Exception('Validation failed: Invalid data.');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized: Please log in.');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Server error: Please try again later.');
      } else {
        throw Exception('Request failed: ${e.response?.statusMessage}');
      }
    } else {
      throw Exception('Unexpected error: $e');
    }
  }
}
