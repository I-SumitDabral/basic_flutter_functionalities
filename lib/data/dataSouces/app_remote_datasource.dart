import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/config/constants/app_api.dart';
import 'package:raftlabs_assignment/data/core/client/api_client.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPet/adopt_pet.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPetData/adopt_pet_data.dart';

abstract class AppRemoteDataSouce {
  final ApiClient _apiClient;

  AppRemoteDataSouce(this._apiClient);
  Future<AdoptPet> fetchData();
}

@LazySingleton(as: AppRemoteDataSouce)
class AppRemoteDataSouceImpl extends AppRemoteDataSouce {
  AppRemoteDataSouceImpl(super.apiClient);

  @override
  Future<AdoptPet> fetchData() async {
    final response = await _apiClient.get(AppApi.endPoint);
    return AdoptPet.fromJson(response);
  }

  AdoptPet parseResponse(dynamic responseBody) {
    return AdoptPet.fromJson(responseBody);
  }
}
