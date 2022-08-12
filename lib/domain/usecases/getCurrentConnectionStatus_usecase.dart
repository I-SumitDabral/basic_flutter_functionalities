import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/entities/no_params.dart';
import 'package:raftlabs_assignment/domain/repositories/app_setup_repository.dart';
import 'package:raftlabs_assignment/domain/usecases/usecase.dart';


@lazySingleton
class GetCurrentNetworkStatusUsecase
    implements StreamedUseCase<Stream<ConnectivityResult>, NoParams> {
  final AppSetupRepository _appSetupRepository;

  GetCurrentNetworkStatusUsecase(this._appSetupRepository);

  @override
  Stream<Either<AppError, Stream<ConnectivityResult>>> call(params) {
    return _appSetupRepository.getConnectionState();
  }
}
