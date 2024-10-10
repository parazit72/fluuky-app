import 'package:dio/dio.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';

class WinnerRepositoryImpl {
  final Dio _dio = DioProvider().createDio();

  Future<WinnersResponse> getWinners() async {
    try {
      final response = await _dio.get('/winners');

      if (response.statusCode == 200) {
        final winnersData = response.data['data'] as List;
        final announcementsData = response.data['lottery_videos'] as List;

        final winners = winnersData.map((winner) => WinnerEntity.fromJson(winner)).toList();
        final announcements = announcementsData.map((announcement) => AnnouncementEntity.fromJson(announcement)).toList();

        return WinnersResponse(winners: winners, announcements: announcements);
      } else {
        throw Exception('Failed to fetch winners: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch winners: ${e.response?.data['message'] ?? e.message}');
    }
  }
}

class WinnersResponse {
  final List<WinnerEntity> winners;
  final List<AnnouncementEntity> announcements;

  WinnersResponse({
    required this.winners,
    required this.announcements,
  });
}
