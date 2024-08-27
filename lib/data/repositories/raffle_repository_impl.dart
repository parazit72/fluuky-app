import 'package:fluuky/data/providers/network/apis/raffle_api.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/providers/network/mock_api_provider.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';

class RaffleRepositoryImpl extends RaffleRepository {
  final APIProvider _apiProvider;

  RaffleRepositoryImpl({String? baseUrl}) : _apiProvider = MockAPIProvider();

  @override
  Future<List<RaffleEntity>> getRaffles() async {
    try {
      final request = RaffleAPI(raffleEndpoint: RaffleEndpoint.getRaffles);
      final response = await _apiProvider.request(request);
      final List<dynamic> raffleList = response['data'];
      return raffleList.map((json) => RaffleEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Get raffles failed: ${e.toString()}');
    }
  }

  @override
  Future<List<RaffleEntity>> getWishlistRaffles() async {
    try {
      final request = RaffleAPI(raffleEndpoint: RaffleEndpoint.getRaffles);
      final response = await _apiProvider.request(request);
      final List<dynamic> raffleList = response['data'];
      return raffleList.map((json) => RaffleEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Get raffles failed: ${e.toString()}');
    }
  }

  @override
  Future<RaffleEntity> getRaffle(int id) async {
    try {
      final request = RaffleAPI(
        raffleEndpoint: RaffleEndpoint.getRaffle,
        bodyData: {'id': id},
      );
      final response = await _apiProvider.request(request);
      final raffle = RaffleEntity.fromJson(response);
      return raffle;
    } catch (e) {
      throw Exception('Get raffle failed: ${e.toString()}');
    }
  }
}
