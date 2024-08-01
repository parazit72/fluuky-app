import 'package:fluuky/data/models/raffle_model.dart';

class RaffleProvider {
  Future<List<RaffleModel>> fetchRaffles() async {
    // Simulating network request
    await Future.delayed(const Duration(seconds: 2));

    return [
      RaffleModel(
          images: ['assets/images/back4.jpg'],
          name: 'Rolex Cosmograph Daytona',
          price: 99.9,
          id: 1,
          brandId: 1,
          categoryId: 1,
          adminId: 1,
          slug: 'null',
          description: 'null',
          capacity: 1,
          status: 'null',
          deadline: DateTime.now()),
      RaffleModel(
          images: ['assets/images/back4.jpg'],
          name: 'Rolex Submariner',
          price: 89.8,
          id: 2,
          brandId: 1,
          categoryId: 1,
          adminId: 1,
          slug: 'null',
          description: 'null',
          capacity: 1,
          status: 'null',
          deadline: DateTime.now()),
      RaffleModel(
          images: ['assets/images/back4.jpg'],
          name: 'Omega Seamaster',
          price: 66.56,
          id: 3,
          brandId: 1,
          categoryId: 1,
          adminId: 1,
          slug: 'null',
          description: 'null',
          capacity: 1,
          status: 'null',
          deadline: DateTime.now()),
    ];
  }
}
