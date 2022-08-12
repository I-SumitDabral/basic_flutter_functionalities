import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/data/core/client/connection_client.dart';
import 'package:raftlabs_assignment/data/core/client/location_client.dart';
import 'package:raftlabs_assignment/domain/entities/location/location_model.dart';

abstract class AppSetupDataSouce {
  final ConnectionClient _client;
  final LocationClient _locationClient;

  AppSetupDataSouce(this._client, this._locationClient);

  Stream<ConnectivityResult> connectionResult();
  Future<LocationModel?> getLocationData();
}

@LazySingleton(as: AppSetupDataSouce)
class AppSetupDatSouceImpl extends AppSetupDataSouce {
  AppSetupDatSouceImpl(super.client, super.locationClient);

  @override
  Stream<ConnectivityResult> connectionResult() async* {
    yield* super._client.getCurrentConnectionStatus();
  }

  @override
  Future<LocationModel?> getLocationData() async {
    final response = await _locationClient.getCurrentLocation();

    return response;
  }
}
