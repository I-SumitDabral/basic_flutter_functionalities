import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:raftlabs_assignment/data/core/enums/app_error.dart';
import 'package:raftlabs_assignment/data/dataSouces/app_setup_datasource.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/entities/location/location_model.dart';
import 'package:raftlabs_assignment/domain/repositories/app_setup_repository.dart';


@LazySingleton(as: AppSetupRepository)
class AppSetupRepositoryImpl implements AppSetupRepository {
  final AppSetupDataSouce _appSetupDataSouce;

  AppSetupRepositoryImpl(this._appSetupDataSouce);
  @override
  Stream<Either<AppError, Stream<ConnectivityResult>>>
      getConnectionState() async* {
    try {
      final response =   _appSetupDataSouce.connectionResult();
      yield right(response);
    } catch (_) {
      yield (left(const AppError(AppErrorType.database)));
    }
  }

  @override
  Future<Either<AppError, LocationModel>> getCurrentLocation()  async{
 try {
      final response = await  _appSetupDataSouce.getLocationData();
      if(response == null){
        return left(const AppError(AppErrorType.database));
      }
      return right(response);
    } catch (_) {
      return (left(const AppError(AppErrorType.database)));
    }
  }
}
