import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPet/adopt_pet.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';

abstract class AnimalRepository {
  Future<Either<AppError, AdoptPet>> fetchData({bool isLocalDB = false});
  Future<Either<AppError, Unit>> clearData();
}
