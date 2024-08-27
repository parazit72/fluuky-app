import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/providers/network/api_representable.dart';

class MockAPIProvider extends APIProvider {
  @override
  Future<Map<String, dynamic>> request(APIRequestRepresentable request) async {
    final jsonResponse = await rootBundle.loadString('assets/mock_responses/raffles.json');
    return json.decode(jsonResponse);
  }

  @override
  Future<Map<String, dynamic>> requestNotification(APIRequestRepresentable request) async {
    final jsonResponse = await rootBundle.loadString('assets/mock_responses/notifications.json');
    return json.decode(jsonResponse);
  }
}
