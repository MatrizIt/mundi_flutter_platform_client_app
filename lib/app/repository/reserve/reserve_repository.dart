import 'dart:convert';

import 'package:mundi_flutter_platform_client_app/app/core/exception/invalid_field_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/reserve/i_reserve_repository.dart';

import '../../core/rest/rest_client.dart';

class ReserveRepository implements IReserveRepository {
  final RestClient rest;
  final LocalStorage localStorage;

  ReserveRepository({required this.localStorage, required this.rest});

  @override
  Future<void> createReserve(
      {required int entrepreneurId,
      required String scheduledDate,
      required int modalityId}) async {
    try {
      final response = await rest.post("/scheduling/schedule", data: {
        "entrepreneurId": entrepreneurId,
        "scheduledDate": scheduledDate,
        "modalityId": modalityId,
        "status": "INIT"
      }, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${await localStorage.read("accessToken")}"
      });

      print("Reserva > ${response.data}");
    } catch (e){
      print("Error check > $e");
    }
  }

  @override
  Future<List<String>> checkHour(
      {required int entrepreneurId, required String date}) async {
    try {
      final response = await rest.get("/scheduling/$entrepreneurId/available-times", headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${await localStorage.read("accessToken")}"
      },queryParameters: {
        "date": date,
      }, );

      // Ação com a lista de horários disponíveis
      List<String> availableTimes = List<String>.from(response.data);
      print("Available times: $availableTimes");

      return availableTimes;
    } catch (e){
      print("Error check > $e");
      return [];
    }
  }

}
