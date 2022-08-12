import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/repositories/app_setup_repository.dart';
import 'package:raftlabs_assignment/domain/usecases/usecase.dart';


@lazySingleton
class FetchUserLocationUseCase implements UseCase {
  final AppSetupRepository _appSetupRepository;

  FetchUserLocationUseCase(this._appSetupRepository);
  @override
  Future<Either<AppError, dynamic>> call(params) async {
    return _appSetupRepository.getCurrentLocation();
  }
}
