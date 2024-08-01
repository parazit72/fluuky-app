import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';

class GetRafflesUseCase {
  final RaffleRepository repository;

  GetRafflesUseCase(this.repository);

  Future<List<RaffleEntity>> execute() {
    return repository.getRaffles();
  }
}
