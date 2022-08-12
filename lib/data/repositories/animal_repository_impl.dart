import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/data/core/enums/app_error.dart';
import 'package:raftlabs_assignment/data/core/tables/adopted_data_table.dart';
import 'package:raftlabs_assignment/data/core/tables/adopted_pet_table.dart';
import 'package:raftlabs_assignment/data/dataSouces/app_local_datasource.dart';
import 'package:raftlabs_assignment/data/dataSouces/app_remote_datasource.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPet/adopt_pet.dart';
import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/repositories/animal_repository.dart';

@LazySingleton(as: AnimalRepository)
class AnimalRepositoryImpl implements AnimalRepository {
  final AppRemoteDataSouce _appRemoteDataSouce;
  final AppLocalDataSource _appLocalDataSource;

  AnimalRepositoryImpl(this._appRemoteDataSouce, this._appLocalDataSource);
  @override
  Future<Either<AppError, AdoptPet>> fetchData({bool isLocalDB = false}) async {
    try {
      if (isLocalDB == true) {
        final response = await _appLocalDataSource.getData();
        if (response != null) {
          return right(response);
        } else {
          return left(const AppError(AppErrorType.noData));
        }
      } else {
        final response = await _appRemoteDataSouce.fetchData();
        await _appLocalDataSource.setUpData(response);
        return right(response);
      }
    } on SocketException catch (_) {
      return const Left(AppError(AppErrorType.network));
    } catch (_) {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, Unit>> clearData() async {
    try {
      await _appLocalDataSource.clearData();
      return right(unit);
    } catch (_) {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
