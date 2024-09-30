import 'package:dio/dio.dart';
import 'package:fluuky/data/models/category_model.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';

class RaffleRepositoryImpl extends RaffleRepository {
  final Dio _dio;

  RaffleRepositoryImpl() : _dio = DioProvider().createDio();

  @override
  Future<List<RaffleEntity>> getRaffles() async {
    try {
      final response = await _dio.get('/draws');
      final List<dynamic> raffleList = response.data['data'];
      return raffleList.map((json) => RaffleEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Get raffles failed: ${e.toString()}');
    }
  }

  @override
  Future<List<CategoryModel>> getRaffleCategories() async {
    try {
      final response = await _dio.get('/categories');
      final List<dynamic> raffleCategoriesList = response.data['data'];
      return raffleCategoriesList.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Get raffle categories failed: ${e.toString()}');
    }
  }

  @override
  Future<List<RaffleEntity>> getWishlistRaffles() async {
    try {
      final response = await _dio.get('/wishlist-raffles');
      final List<dynamic> raffleList = response.data['data'];
      return raffleList.map((json) => RaffleEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Get wishlist raffles failed: ${e.toString()}');
    }
  }

  @override
  Future<RaffleEntity> getRaffle(int id) async {
    try {
      final response = await _dio.get('/raffles/$id');
      final raffle = RaffleEntity.fromJson(response.data);
      return raffle;
    } catch (e) {
      throw Exception('Get raffle failed: ${e.toString()}');
    }
  }
}
