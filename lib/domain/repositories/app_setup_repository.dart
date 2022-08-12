import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:raftlabs_assignment/domain/entities/location/location_model.dart';

abstract class AppSetupRepository {
  Stream<Either<AppError, Stream<ConnectivityResult>>> getConnectionState();
  Future<Either<AppError, LocationModel>> getCurrentLocation();
}
