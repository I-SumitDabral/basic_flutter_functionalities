part of 'location_cubit_cubit.dart';

@freezed
class LocationCubitState with _$LocationCubitState {
  const factory LocationCubitState.initial() = _Initial;
  const factory LocationCubitState.fetched(double data) = _Fetched;
  const factory LocationCubitState.error(AppErrorType type) = _Error;
}
