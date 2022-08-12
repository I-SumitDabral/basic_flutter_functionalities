import 'package:dartz/dartz.dart';
import 'package:raftlabs_assignment/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
  
}
abstract class StreamedUseCase<Type, Params> {
  Stream<Either<AppError, Type>> call(Params params);
  
}
