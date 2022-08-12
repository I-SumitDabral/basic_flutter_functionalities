import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/repositories/animal_repository.dart';
import 'package:raftlabs_assignment/domain/usecases/usecase.dart';

@lazySingleton
class ClearLocalDataUseCase implements UseCase {
  final AnimalRepository _animalRepository;

  ClearLocalDataUseCase(this._animalRepository);
  @override
  Future<Either<AppError, Unit>> call(params) async {
    return _animalRepository.clearData();
  }
}
