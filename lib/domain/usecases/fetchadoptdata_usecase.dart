import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPet/adopt_pet.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPetData/adopt_pet_data.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/entities/no_params.dart';
import 'package:raftlabs_assignment/domain/repositories/animal_repository.dart';
import 'package:raftlabs_assignment/domain/usecases/usecase.dart';

@lazySingleton
class FetchAdoptDataUseCase implements UseCase<AdoptPet, bool> {
  final AnimalRepository _animalRepository;

  FetchAdoptDataUseCase(this._animalRepository);
  @override
  Future<Either<AppError, AdoptPet>> call(bool params) async {
    return _animalRepository.fetchData(isLocalDB: params);
  }
}
